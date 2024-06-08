mod circuit_config;
mod lutmagic;
mod config_enumerator;
mod gpc_solver;
use crate::gpc_solver::GpcSolver;

fn main() {
    let arg: String = std::env::args().skip(1).next().unwrap();
    let shape: Vec<u32> = arg.chars().map(|c|c.to_digit(10).unwrap() as u32).rev().collect();
    match GpcSolver::new(shape).solve() {
        Ok(sol) => println!("{}", sol.to_json()),
        Err(e) => panic!("{}", e),
    }
}
