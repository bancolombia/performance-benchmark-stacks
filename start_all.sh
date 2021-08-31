#!/bin/bash

stacks=("nodejs/express" "nodejs/fastify" "nodejs/nestjs" "nodejs/nestjs-express-reactive" "nodejs/nestjs-fastify-reactive" "java/spring-boot-tomcat" "java/spring-boot-webflux" "elixir/plug-cowboy" "go/gin" "rust/actix")
scenarios=("health-check" "cipher-bcrypt" "hash-sha256")

for stack in "${stacks[@]}"; do
  echo "Starting $stack"
  ./start.sh "$stack" "${scenarios[@]}" &
done

wait
echo "All stacks terminated"

cd reports || exit
./start.sh
