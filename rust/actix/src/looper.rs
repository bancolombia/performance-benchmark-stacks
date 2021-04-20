use std::any::Any;
use std::ffi::c_void;
use std::ops::Add;
use std::time::{Duration, SystemTime};

use crate::percentage;

pub fn start(f: &dyn Fn(), per: i32, delay: i32) -> i64 {
    let mut count = 0;
    if percentage::is_in_percentage(per as f64) {
        let end_at = SystemTime::now().add(Duration::from_millis(delay as u64));
        f();
        count = 1;
        while end_at.gt(&SystemTime::now()) && delay != 0 {
            f();
            count += 1;
        }
    }
    return count;
}
