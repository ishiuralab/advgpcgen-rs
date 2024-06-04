mod circuit_config;
mod lutmagic;
mod config_enumerator;
mod gpc_solver;
mod gpc_enumerator;
use crate::gpc_enumerator::GpcEnumerator;
use std::env;

fn main() {
    let arg: String = env::args().skip(1).next().unwrap();
    let length: u32 = arg.parse().unwrap();
    let mut gpcenum = GpcEnumerator::new(length);
    gpcenum.solve();
}
