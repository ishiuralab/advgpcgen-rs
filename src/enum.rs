mod circuit_config;
mod lutmagic;
mod config_enumerator;
mod gpc_solver;
mod gpc_enumerator;
use crate::gpc_enumerator::GpcEnumerator;

fn main() {
    let arg: String = std::env::args().skip(1).next().unwrap_or("4".to_string());
    let width: u32 = arg.parse().unwrap();
    if width == 0 {
        panic!("Maximum width must be larger than 0.");
    }
    GpcEnumerator::</* SPLIT = */false>::new(width).solve();
}
