use serde::{Serialize, Deserialize};

#[derive(Clone, Debug, Ord, PartialOrd, Eq, PartialEq, Serialize, Deserialize)]
pub struct CircuitConfig {
    pub shape: Vec<u32>,
    pub lut: Vec<(Vec<u32>, Option<u32>, Option<u64>)>, // vec![(vec![symmetric_input_signals], asymmetric_input_signal, (prop << (1 << symms.len()) | gene))]
    pub cin: Option<u32>,
}

impl CircuitConfig {
    pub fn from_json(json: &String) -> Self {
        serde_json::from_str::<CircuitConfig>(&json).unwrap()
    }

    pub fn get_total(&self) -> u32 {
        self.shape.iter()
            .enumerate()
            .map(|(place, &num)| num << place)
            .sum::<u32>() + 1
    }

    pub fn get_width(&self) -> u32 {
        32 - self.get_total().leading_zeros()
    }

    pub fn get_weights(&self) -> Vec<u32> {
        self.shape
            .iter()
            .enumerate()
            .flat_map(|(place, &num)| std::iter::repeat(place as u32).take(num as usize))
            .collect()
    }

    pub fn to_json(&self) -> String {
        serde_json::to_string(&self)
            .unwrap()
    }
}
