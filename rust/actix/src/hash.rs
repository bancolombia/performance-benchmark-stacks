use std::str;

use log::{info, trace, warn};
use sha2::{Digest, Sha256};

pub fn sha_256(plain: String) -> &'static str {
    let mut hasher = Sha256::new();
    hasher.update(plain);
    let res = hasher.finalize();
    // TODO: parse res to hex
    return "hex here";
}
