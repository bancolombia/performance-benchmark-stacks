use actix_web::{App, get, HttpResponse, HttpServer, Responder, web};
use uuid::Uuid;

use crate::models::{LoopStatus, QueryOptions, Status};

mod percentage;
mod hash;
mod hash_service;
mod looper;
mod models;
mod crypt;
mod crypt_service;

fn looped_req(options: web::Query<QueryOptions>, f: &dyn Fn()) -> LoopStatus {
    let times = looper::start(f, options.percentage.unwrap_or(100), options.delay.unwrap_or(0));
    return LoopStatus {
        status: String::from("OK"),
        applied: times > 0,
        times,
    };
}

#[get("/hash")]
async fn hash_path(options: web::Query<QueryOptions>) -> impl Responder {
    let res = looped_req(options, &hash_service::process);
    HttpResponse::Ok().json(res)
}

#[get("/crypt")]
async fn crypt_path(options: web::Query<QueryOptions>) -> impl Responder {
    let res = looped_req(options, &crypt_service::process);
    HttpResponse::Ok().json(res)
}

#[get("/status")]
async fn status_path() -> impl Responder {
    let res = Status {
        status: String::from("UP")
    };
    HttpResponse::Ok().json(&res)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .service(status_path)
            .service(hash_path)
            .service(crypt_path)
    })
        .bind("0.0.0.0:8080")?
        .run()
        .await
}
