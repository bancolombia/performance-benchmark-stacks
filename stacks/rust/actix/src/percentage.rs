use rand::prelude::*;

pub fn is_in_percentage(percentage: f64) -> bool {
    let mut rng = rand::thread_rng();
    let y: f64 = rng.gen();
    return y * 100.0 < percentage;
}
