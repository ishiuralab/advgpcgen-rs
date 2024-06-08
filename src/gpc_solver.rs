use std::cmp::max;

use crate::circuit_config::CircuitConfig;
use crate::config_enumerator::ConfigEnumerator;

#[derive(Clone, Debug)]
pub struct GpcSolver {
    pub shape: Vec<u32>,
    pub lutnum: u32,
    pub shifted: Vec<u32>,
    pub splitted: Vec<usize>,
}

pub fn trim_zeros(vec: &Vec<u32>) -> &[u32] {
    let begin = vec.iter()
        .position(|&x| x != 0)
        .unwrap_or(vec.len());
    let end = vec.iter()
        .rposition(|&x| x != 0)
        .map_or(0, |x| x + 1);
    &vec[begin..end]
}

pub fn trim_upper_zeros(vec: &Vec<u32>) -> &[u32] {
    let end = vec.iter()
        .rposition(|&x| x != 0)
        .map_or(0, |x| x + 1);
    &vec[0..end]
}

impl GpcSolver {
    pub fn new(mut shape: Vec<u32>) -> Self {
        let total: u32 = shape.iter().enumerate().map(|(p, n)|n << p).sum();
        let width: u32 = 32 - total.leading_zeros();
        let lutnum = width - 1;
        shape = trim_upper_zeros(&shape).to_vec();
        shape.extend(vec![0; max(0, lutnum as i32 - shape.len() as i32) as usize]);
        let accum = (0..lutnum)
            .map(|i| (0..(i+1))
                 .map(|j|shape[j as usize] << j)
                 .sum::<u32>())
            .collect::<Vec<_>>();
        let shifted = accum.iter()
            .enumerate()
            .map(|(p, &n)| n >> (p + 1))
            .collect::<Vec<_>>();
        let mut splitted = vec![0 as usize];
        for (place, &num) in shifted.iter().enumerate() {
            if num < 2 {
                splitted.push(place + 1);
            }
        }
        Self {
            shape: shape,
            lutnum: lutnum,
            shifted: shifted,
            splitted: splitted,
        }
    }

    pub fn solve(&self) -> Result<CircuitConfig, &'static str> {
        let mut solution = CircuitConfig {
            shape: self.shape.clone(),
            lut: (0..self.lutnum)
                .map(|_| (vec![], None, None))
                .collect(),
            cin: Some(0),
        };
        let mut shape = self.shape.clone();
        let mut iter = self.splitted.iter();
        let mut offset = 0;
        if let Some(mut begin) = iter.next() {
            for end in iter {
                let mut target = shape[*begin..*end].to_vec();
                if *begin == 0 {
                    if target[0] > 0 {
                        shape[0] -= 1;
                        target[0] -= 1;
                        offset += 1;
                    }else {
                        return Err("The least segnificant position must have at least one input.");
                    }
                }
                if target.len() == 1 && target[0] == 0 {
                    if *end < shape.len() {
                        if shape[*end] > 0 {
                            shape[*end] -= 1;
                            solution.lut[*end - 1] = (vec![offset], None, Some(2));
                            offset += 1;
                        }
                    }
                    begin = end;
                    continue;
                }
                let config_enum = ConfigEnumerator::new(target.clone());
                let sol = match config_enum.solve() {
                    Ok(sol) => sol,
                    Err(err) => return Err(err),
                };
                for (place, (symms, asymm, init)) in sol.lut.iter().enumerate() {
                    solution.lut[*begin + place] = (
                        symms.iter().map(|&n| n + offset).collect(),
                        asymm.map_or(None, |n| Some(n + offset)),
                        *init,
                    );
                }
                offset += target.iter().sum::<u32>();
                begin = end;
            }
        }
        Ok(solution)
    }
}
