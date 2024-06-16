use std::collections::{BTreeSet, BTreeMap};

use crate::circuit_config::CircuitConfig;
use crate::lutmagic::LutMagic;

#[derive(Clone, Debug, PartialEq)]
enum LutSigType {
    Symm,
    Asymm,
}

#[derive(Clone, Debug)]
pub struct ConfigEnumerator {
    shape: Vec<u32>,
    lutnum: u32,
    place2index: BTreeMap<(u32, u32), u32>,
}

#[allow(dead_code)]
impl ConfigEnumerator {
    pub fn new(shape: Vec<u32>) -> Self {
        let total: u32 = shape.iter().enumerate().map(|(p, n)|n << p).sum::<u32>() + 1;
        let width: u32 = 32 - total.leading_zeros();
        let lutnum: u32 = width - 1;
        let mut place2index: BTreeMap<(u32, u32), u32> = BTreeMap::new();
        let mut cnt = 0;
        for (place, &num) in shape.iter().enumerate() {
            for idx in 0..num {
                place2index.insert((place as u32, idx), cnt);
                cnt += 1;
            }
        }
        Self {
            shape: shape,
            lutnum: lutnum,
            place2index: place2index,
        }
    }

    pub fn solve(&self) -> Result<CircuitConfig, &'static str> {
        if *self.shape.iter().max().unwrap_or(&0) > 6 {
            return Err("Number of input of the GPC must be less than 7 (excluding cin).");
        }
        let groups: Vec<BTreeSet<u32>> = self.shape.iter()
            .map(|&n| vec![0, n].into_iter().collect())
            .collect();
        let lut_signals: Vec<BTreeMap<(u32, u32, u32), LutSigType>> = self.shape.iter()
            .enumerate()
            .map(|(p, &n)| vec![((p as u32, 0, n), LutSigType::Symm)].into_iter().collect())
            .collect();
        return self.enum_recursively(0, &groups, &lut_signals);
    }

    fn enum_recursively(&self, lutidx: usize, groups: &Vec<BTreeSet<u32>>,
                        lut_signals: &Vec<BTreeMap<(u32, u32, u32), LutSigType>>) -> Result<CircuitConfig, &'static str>{
        if lutidx as u32 >= self.lutnum {
            let config = self.get_config(&lut_signals);
            let lutmagic = LutMagic::new(config);
            return lutmagic.build();
        }else {
            if let Some(sol) = self.enum_symmetric_lut(lutidx, &groups, &lut_signals) {
                return Ok(sol);
            }
            if let Some(sol) = self.enum_asymmetric_lut(lutidx, &groups, &lut_signals) {
                return Ok(sol);
            }
        }
        Err("No feasible configurations.")
    }

    fn get_config(&self, lut_signals: &Vec<BTreeMap<(u32, u32, u32), LutSigType>>) -> CircuitConfig {
        let mut symms = vec![vec![]; self.lutnum as usize];
        let mut asymm = vec![None as Option<u32>; self.lutnum as usize];
        for idx in 0..self.lutnum {
            for ((place, begin, end), typ) in &lut_signals[idx as usize] {
                if *typ == LutSigType::Symm {
                    for i in *begin..*end {
                        symms[idx as usize].push(self.place2index[&(*place, i)]);
                    }
                }else {
                    asymm[idx as usize] = Some(self.place2index[&(*place, *begin)]);
                }
            }
        }
        CircuitConfig {
            shape: self.shape.clone(),
            lut: symms.iter()
                .zip(asymm.iter())
                .map(|(symm_sigs, asymm_sig)| (symm_sigs.clone(), *asymm_sig, None))
                .collect::<Vec<_>>(),
            cin: None,
        }
    }

    fn enum_symmetric_lut(&self, lutidx: usize, groups: &Vec<BTreeSet<u32>>,
                          lut_signals: &Vec<BTreeMap<(u32, u32, u32), LutSigType>>) -> Option<CircuitConfig>{
        let sizes = self.get_group_sizes(&groups, lutidx);
        let vacants = 5 - lut_signals[lutidx].iter().map(|((_place, begin, end), _)| end - begin).sum::<u32>() as i32;
        if vacants < 0 {
            return None
        }
        let flatten = self.flatten_groups(&groups);
        for i in 0..(vacants as u32 + 1) {
            let patterns = self.pick(&sizes, i);
            for pattern in patterns {
                let usage = pattern.iter()
                    .zip(flatten.iter())
                    .map(|(num, (place, begin, end))| (*place, *begin, *begin + *num, *end))
                    .collect::<Vec<_>>();
                let (groups_, lut_signals_) = self.get_next_state(lutidx, groups.clone(), lut_signals.clone(), &usage, true);
                match self.enum_recursively(lutidx + 1, &groups_, &lut_signals_) {
                    Ok(sol) => return Some(sol),
                    Err(_err) => (),
                }
            }
        }
        None
    }

    fn enum_asymmetric_lut(&self, lutidx: usize, groups: &Vec<BTreeSet<u32>>,
                           lut_signals: &Vec<BTreeMap<(u32, u32, u32), LutSigType>>) -> Option<CircuitConfig>{
        let sizes = self.get_group_sizes(&groups, lutidx);
        let vacants = 6 - lut_signals[lutidx].iter().map(|((_place, begin, end), _typ)| end - begin).sum::<u32>();
        let flatten = self.flatten_groups(&groups);
        let patterns = self.pick(&sizes, vacants);
        for pattern in patterns {
            let usage = pattern.iter()
                .zip(flatten.iter())
                .map(|(num, (place, begin, end))| (*place, *begin, *begin + *num, *end))
                .collect::<Vec<_>>();
            let (groups_, lut_signals_) = self.get_next_state(lutidx, groups.clone(), lut_signals.clone(), &usage, true);
            let subsizes = lut_signals_[lutidx].iter()
                .map(|((_place, begin, end), _typ)| end - begin)
                .collect::<Vec<_>>();
            let subpatterns = self.pick(&subsizes, 1);
            for subpattern in subpatterns {
                let subusage = subpattern.iter()
                    .zip(lut_signals_[lutidx].iter())
                    .map(|(num, ((place, begin, end), _))| (*place, *begin, begin + num, *end))
                    .collect::<Vec<_>>();
                let (next_groups, next_lut_signals) = self.get_next_state(lutidx, groups_.clone(), lut_signals_.clone(), &subusage, false);
                match self.enum_recursively(lutidx + 1, &next_groups, &next_lut_signals) {
                    Ok(sol) => return Some(sol),
                    Err(_err) => (),
                }
            }
        }
        None
    }

    fn get_next_state(&self, lutidx: usize, mut groups: Vec<BTreeSet<u32>>,
                      mut lut_signals: Vec<BTreeMap<(u32, u32, u32), LutSigType>>,
                      usage: &Vec<(u32, u32, u32, u32)>, symmetric: bool) -> (Vec<BTreeSet<u32>>, Vec<BTreeMap<(u32, u32, u32), LutSigType>>) {
        for (place, begin, mid, end) in usage {
            if begin < mid && mid < end {
                groups[*place as usize].insert(*mid);
            }
        }
        if symmetric {
            lut_signals[lutidx] = BTreeMap::new();
            let mut iter = groups[lutidx].iter();
            if let Some(mut prev) = iter.next() {
                for curr in iter {
                    lut_signals[lutidx].insert((lutidx as u32, *prev, *curr), LutSigType::Symm);
                    prev = curr;
                }
            }
            for (place, begin, mid, _end) in usage {
                if begin < mid {
                    lut_signals[lutidx].insert((*place, *begin, *mid), LutSigType::Symm);
                }
            }
        }else {
            lut_signals[lutidx] = BTreeMap::new();
            for (place, begin, mid, end) in usage {
                if begin < mid {
                    lut_signals[lutidx].insert((*place, *begin, *mid), LutSigType::Asymm);
                }
                if mid < end {
                    lut_signals[lutidx].insert((*place, *mid, *end), LutSigType::Symm);
                }
            }
        }
        (groups, lut_signals)
    }

    fn get_group_sizes(&self, groups: &Vec<BTreeSet<u32>>, end: usize) -> Vec<u32> {
        let mut sizes = Vec::<u32>::new();
        for group in &groups[..end] {
            let mut iter = group.iter();
            if let Some(mut prev) = iter.next() {
                for curr in iter {
                    sizes.push(curr - prev);
                    prev = curr;
                }
            }
        }
        sizes
    }

    fn flatten_groups(&self, groups: &Vec<BTreeSet<u32>>) -> Vec<(u32, u32, u32)> {
        let mut flatten = Vec::<(u32, u32, u32)>::new();
        for (place, group) in groups.iter().enumerate() {
            let mut iter = group.iter();
            if let Some(mut prev) = iter.next() {
                for curr in iter {
                    flatten.push((place as u32, *prev, *curr));
                    prev = curr;
                }
            }
        }
        flatten
    }

    fn pick(&self, srclist: &[u32], num: u32) -> Vec<Vec<u32>> {
        let mut ans = Vec::<Vec<u32>>::new();
        self.pick_recursively(&mut ans, &srclist, num, 0, 0, vec![0; srclist.len()]);
        ans
    }

    fn pick_recursively(&self, ans: &mut Vec<Vec<u32>>, srclist: &[u32],num: u32,
                        csum:u32, idx: u32, mut used: Vec<u32>) {
        if csum == num {
            ans.push(used.to_vec());
        }else if idx as usize == srclist.len() || csum > num {
            return;
        }else {
            for i in 0..(srclist[idx as usize] + 1) {
                self.pick_recursively(ans, &srclist, num, csum + i, idx + 1, used.clone());
                used[idx as usize] += 1;
            }
        }
    }
}
