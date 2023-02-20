use std::str;

use hex::encode;
use log::{info, trace, warn};
use sha2::{Digest, Sha256};

pub fn sha_256(plain: String) -> String {
    let mut hasher = Sha256::new();
    hasher.update(plain);
    let res = &hasher.finalize()[..];
    return encode(res);
}
