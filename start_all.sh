#!/bin/bash

stacks=("nodejs/express" "nodejs/nestjs" "java/spring-boot-tomcat" "java/spring-boot-webflux" "elixir/plug-cowboy", "go/gin")
#stacks=("java/spring-boot-tomcat")
scenarios=("health-check" "cipher-bcrypt" "hash-sha256")

for stack in "${stacks[@]}"; do
  echo "Starting $stack"
  ./start.sh "$stack" "${scenarios[@]}" &
done

wait
echo "All stacks terminated"

cd reports || exit
./start.sh
