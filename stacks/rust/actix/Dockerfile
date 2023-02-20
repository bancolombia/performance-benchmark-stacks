FROM rust as builder
WORKDIR app
COPY actix .
RUN cargo build --release --bin actix
RUN ls target/release

FROM rust as runtime
WORKDIR app
COPY --from=builder /app/target/release/actix ./
EXPOSE 8080
CMD ["./actix"]
