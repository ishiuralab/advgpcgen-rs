mod circuit_config;
mod lutmagic;
mod config_enumerator;
mod gpc_solver;
mod gpc_enumerator;
use crate::gpc_enumerator::GpcEnumerator;

fn main() {
    let mut gpcenum = GpcEnumerator::new(4);
    gpcenum.solve();
}
