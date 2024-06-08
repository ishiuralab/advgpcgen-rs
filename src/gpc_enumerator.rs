use std::io::Write;

use crate::circuit_config::CircuitConfig;
use crate::gpc_solver::{trim_zeros, GpcSolver};


#[derive(Clone, Debug)]
pub struct GpcEnumerator<const SPLIT: bool> {
    max_width: u32,
    max_feasibles: Vec<CircuitConfig>,
    min_infeasibles: Vec<Vec<u32>>,
}

impl<const SPLIT: bool> GpcEnumerator<SPLIT> {
    pub fn new(max_width: u32) -> Self {
        Self {
            max_width: max_width,
            max_feasibles: vec![],
            min_infeasibles: vec![],
        }
    }

    pub fn solve(&mut self) {
        self.enum_recursively(vec![]);
        println!("max_feasibles");
        for feasible in self.max_feasibles.iter() {
            println!("{}", feasible.to_json());
        }
        println!("min_infeasibles");
        for infeasible in self.min_infeasibles.iter() {
            println!("{:?}", infeasible);
        }
    }

    fn enum_recursively(&mut self, mut shape: Vec<u32>) {
        if shape.len() >= self.max_width as usize {
            let target: Vec<u32> = shape
                .iter()
                .rev()
                .cloned()
                .collect::<Vec<_>>();
            if target[0] == 0 {
                return;
            }
            print!("{:?} ", target);
            std::io::stdout().flush().unwrap();
            let solver = GpcSolver::new(target.clone());

            if solver.lutnum > self.max_width {
                println!("total over");
                return;
            }

            if SPLIT && solver.splitted.len() > 2 {
                println!("splittable");
                return;
            }

            if self.obviously_feasible(&target) {
                println!("obviously feasible");
                return;
            }

            if self.obviously_infeasible(&target) {
                println!("obviously infeasible");
                return;
            }

            match solver.solve() {
                Ok(sol) => {
                    println!("feasible");
                    self.add_feasible(sol);
                    println!(
                        "max_feasibles: {:?}",
                        self.max_feasibles.iter()
                            .map(|f|&f.shape)
                            .collect::<Vec<_>>()
                    );
                }
                Err(_err) => {
                    println!("infeasible");
                    self.add_infeasible(target);
                    println!("min_infeasibles: {:?}", self.min_infeasibles);
                }
            }
        }else {
            shape.push(0);
            for _i in 0..8 {
                self.enum_recursively(shape.clone());
                *shape.last_mut().unwrap() += 1;
            }
        }
    }

    fn add_feasible(&mut self, sol: CircuitConfig) {
        if self.obviously_feasible(&sol.shape) {
            return;
        }
        let mut max_feasibles = self.max_feasibles.clone();
        max_feasibles.retain(|feasible|!Self::is_subcounter(&sol.shape, &feasible.shape));
        max_feasibles.push(sol);
        self.max_feasibles = max_feasibles;
    }

    fn add_infeasible(&mut self, shape: Vec<u32>) {
        if self.obviously_infeasible(&shape) {
            return;
        }
        let mut min_infeasibles = self.min_infeasibles.clone();
        min_infeasibles.retain(|infeasible|!Self::is_subcounter(&infeasible, &shape));
        min_infeasibles.push(shape);
        self.min_infeasibles = min_infeasibles;
    }

    fn obviously_feasible(&self, shape: &Vec<u32>) -> bool {
        self.max_feasibles.iter()
            .map(|config| &config.shape)
            .any(|feasible|Self::is_subcounter(&feasible, &shape))
    }

    fn obviously_infeasible(&self, shape: &Vec<u32>) -> bool {
        self.min_infeasibles.iter()
            .any(|infeasible|Self::is_subcounter(&shape, &infeasible))
    }

    fn is_subcounter(main: &Vec<u32>, sub: &Vec<u32>) -> bool {
        let main_ = trim_zeros(&main);
        let sub_ = trim_zeros(&sub);
        if main_.len() < sub_.len() {
            return false;
        }else {
            return (0..(main_.len() - sub_.len() + 1))
                .any(|begin|(0..sub_.len())
                     .all(|i|main_[i + begin] >= sub_[i])
                );
        }
    }
}
