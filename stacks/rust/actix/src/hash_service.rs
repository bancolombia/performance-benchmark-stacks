use uuid::Uuid;

use crate::hash;
use crate::percentage;

pub fn process() {
    let uuid = Uuid::new_v4().to_hyphenated().to_string();
    hash::sha_256(uuid);
}
