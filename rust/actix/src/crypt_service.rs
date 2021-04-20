use uuid::Uuid;

use crate::crypt;

pub fn process() {
    let plain: String = Uuid::new_v4().to_hyphenated().to_string();
    let hash = crypt::encrypt(&plain);
    let valid = crypt::validate(&plain, hash);
    assert_eq!(true, valid)
}
