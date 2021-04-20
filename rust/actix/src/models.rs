use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
pub struct Status {
    pub status: String
}

#[derive(Serialize, Deserialize)]
pub struct LoopStatus {
    pub status: String,
    pub applied: bool,
    pub times: i64,
}

#[derive(Deserialize)]
pub struct QueryOptions {
    pub percentage: Option<i32>,
    pub delay: Option<i32>,
}
