use std::collections::HashMap;

extern crate lazy_static;
use lazy_static::lazy_static;

use crate::circuit_config::CircuitConfig;

lazy_static! {
    // ci, g, p -> co, o
    pub static ref CCUNIT: HashMap<(bool, bool, bool), (bool, bool)> = {
        let mut tb = HashMap::new();
        tb.insert((false, false, false), (false, false));
        tb.insert((false, false, true ), (false, true ));
        tb.insert((false, true , false), (true , false));
        tb.insert((false, true , true ), (false, true ));
        tb.insert((true , false, false), (false, true ));
        tb.insert((true , false, true ), (true , false));
        tb.insert((true , true , false), (true , true ));
        tb.insert((true , true , true ), (true , false));
        tb
    };
}

#[derive(Clone, Debug)]
pub struct LutMagic {
    spec: CircuitConfig,
    weights: Vec<u32>,
    srclen: u32,
    inv_cctable: Vec<Vec<u32>>, // dst -> index of (g,p,g,p...)
}

impl LutMagic {
    pub fn new(spec: CircuitConfig) -> Self {
        let weights = spec.get_weights();
        let srclen = spec.shape.iter().sum();
        let cctable = Self::get_carrychain_truth_table(&spec);
        let inv_cctable = Self::invert_truth_table(&spec, &cctable);
        Self {
            spec: spec,
            weights: weights,
            srclen: srclen,
            inv_cctable: inv_cctable,
        }
    }

    fn get_carrychain_truth_table(spec: &CircuitConfig) -> Vec<Vec<bool>> {
        let cclen = spec.get_width() - 1;
        let ccsrclen = cclen * 2;
        let mut table = vec![vec![false; (cclen + 1) as usize]; 1 << ccsrclen];
        for (src, dst_bits) in table.iter_mut().enumerate() {
            let src_bits: Vec<bool> = (0..ccsrclen)
                .map(|p| (src & (1 << p)) != 0)
                .collect();
            let prop: Vec<bool> = src_bits.iter()
                .skip(0)
                .step_by(2)
                .map(|b|*b)
                .collect();
            let gene: Vec<bool> = src_bits.iter()
                .skip(1)
                .step_by(2)
                .map(|b|*b)
                .collect();
            let mut carryout = false;
            for i in 0..cclen {
                (carryout, dst_bits[i as usize]) = CCUNIT[&(carryout, gene[i as usize], prop[i as usize])];
            }
            dst_bits[cclen as usize] = carryout;
        }
        table
    }

    fn invert_truth_table(spec: &CircuitConfig, table: &Vec<Vec<bool>>) -> Vec<Vec<u32>> {
        let width = spec.get_width();
        let mut inv = vec![vec![]; ((1 << width) - 1) as usize];
        for (src, dst_bits) in table.iter().enumerate() {
            let dst: usize = dst_bits.iter()
                .enumerate()
                .map(|(place, bit)|(*bit as usize) << place)
                .sum();
            inv[dst].push(src as u32);
        }
        inv
    }

    pub fn build(&self) -> Result<CircuitConfig, &'static str> {
        let table = self.get_candidates_table();
        let mut spec: CircuitConfig = self.spec.clone();
        for (index, (symms, asymm, _init)) in self.spec.lut.iter().enumerate() {
            if let Some(asymm_index) = asymm {
                let mut asymms = symms.clone();
                asymms.push(*asymm_index);
                let prop = match self.get_lut_initval(&table, index * 2, &asymms) {
                    Ok(prop) => prop,
                    Err(error) => return Err(error),
                };
                let _gene = match self.get_lut_initval(&table, index * 2 + 1, &symms) {
                    Ok(gene) => gene,
                    Err(error) => return Err(error),
                };
                spec.lut[index] = (symms.clone(), asymm.clone(), Some(prop));
            }else {
                let prop = match self.get_lut_initval(&table, index * 2, &symms) {
                    Ok(prop) => prop,
                    Err(error) => return Err(error),
                };
                let gene = match self.get_lut_initval(&table, index * 2 + 1, &symms) {
                    Ok(gene) => gene,
                    Err(error) => return Err(error),
                };
                let init = prop << (1 << symms.len()) | gene;
                spec.lut[index] = (symms.clone(), asymm.clone(), Some(init));
            }
        }
        Ok(spec)
    }

    fn get_lut_initval(&self, table: &Vec<Vec<u32>>, output: usize, indexes: &Vec<u32>) -> Result<u64, &'static str> {
        let unused_indexes = self.get_unused_indexes(&indexes);
        let mut init: u64 = 0;
        for used_src in 0..(1 << indexes.len()) {
            let unused_src = 0;
            let src = self.map_srcbits(&indexes, &unused_indexes, used_src, unused_src);
            if table[src as usize].len() > 0 {
                init |= ((table[src as usize][0] as u64 >> output) & 1) << used_src;
            }else {
                return Err("LUT construction failure.");
            }
        }
        Ok(init)
    }

    fn get_candidates_table(&self) -> Vec<Vec<u32>> {
        let mut table = (0..(1 << self.srclen))
            .map(|src|self.inv_cctable[(0..self.srclen).map(|i| ((src >> i) & 1) << self.weights[i as usize]).sum::<usize>()].clone())
            .collect();
        for (index, (symms, asymm, _init)) in self.spec.lut.iter().enumerate() {
            if let Some(asymm_index) = asymm {
                let mut asymms = symms.clone();
                asymms.push(*asymm_index);
                self.apply_constraint_asymm_lut(&mut table, index * 2, index * 2 + 1, &asymms, &symms);
            }else {
                self.apply_constraint_symm_lut(&mut table, index * 2, &symms);
                self.apply_constraint_symm_lut(&mut table, index * 2 + 1, &symms);
            }
        }
        table
    }

    fn apply_constraint_symm_lut(&self, table: &mut Vec<Vec<u32>>, output: usize, indexes: &Vec<u32>) {
        let unused_indexes = self.get_unused_indexes(&indexes);
        let fanin = indexes.len() as u32;
        for used_src in 0..(1 << fanin) {
            let mut availability: u8 = 0b11;
            for unused_src in 0..(1 << (self.srclen - fanin)) {
                let src = self.map_srcbits(&indexes, &unused_indexes, used_src, unused_src);
                let mut partial_availability: u8 = 0;
                for cand in table[src as usize].iter().map(|&b| (b >> output) & 1) {
                    partial_availability |= 1 << cand;
                }
                availability &= partial_availability;
            }
            for unused_src in 0..(1 << (self.srclen - fanin)) {
                let src = self.map_srcbits(&indexes, &unused_indexes, used_src, unused_src);
                table[src as usize]
                    .retain(|&cand| (availability & (1 << ((cand >> output) & 1))) != 0);
            }
        }
    }

    fn get_unused_indexes(&self, indexes: &[u32]) -> Vec<u32> {
        let mut used = vec![false; self.srclen as usize];
        for &index in indexes {
            used[index as usize] = true;
        }
        (0..self.srclen).filter(|&i| !used[i as usize]).collect::<Vec<u32>>()
    }

    fn map_srcbits(&self, used_indexes: &[u32], unused_indexes: &[u32], used_src: u32, unused_src: u32) -> u32 {
        let mut bits = vec![false; self.srclen as usize];
        for (i, &index) in used_indexes.iter().enumerate() {
            bits[index as usize] = ((used_src >> i) & 1) != 0;
        }
        for (i, &index) in unused_indexes.iter().enumerate() {
            bits[index as usize] = ((unused_src >> i) & 1) != 0;
        }
        bits.iter()
            .enumerate()
            .map(|(p, &b)| (b as u32) << p)
            .sum()
    }

    fn apply_constraint_asymm_lut(&self, table: &mut Vec<Vec<u32>>, prop: usize, gene: usize,
                                  prop_indexes: &Vec<u32>, gene_indexes: &Vec<u32>) {
        self.apply_constraint_symm_lut(table, prop, &prop_indexes);
        self.apply_constraint_symm_lut(table, gene, &gene_indexes);
        let didx = prop_indexes.last().expect("prop_indexes is empty!");
        for src in 0..(1 << self.srclen) {
            if (src & (1 << didx)) == 0 {
                table[src]
                    .retain(|&cand| ((cand >> prop) & 1) == ((cand >> gene) & 1));
            }
        }
    }
}
