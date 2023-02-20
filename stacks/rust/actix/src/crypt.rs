extern crate bcrypt;

use bcrypt::{hash, verify};

pub fn encrypt(plain: &str) -> String {
    return hash(plain, 10).unwrap();
}

pub fn validate(plain: &str, hashed: String) -> bool {
    return verify(plain, &hashed).unwrap();
}
