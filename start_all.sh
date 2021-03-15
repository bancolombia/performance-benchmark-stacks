#!/bin/bash

stacks=("nodejs/express" "nodejs/nestjs" "java/spring-boot-tomcat" "java/spring-boot-webflux" "elixir/plug-cowboy")
scenarios=("health-check")

for stack in "${stacks[@]}"; do
  echo "Starting $stack"
  ./start.sh "$stack" "${scenarios[@]}" &
done

wait
echo "All stacks terminated"

cd reports || exit
./start.sh
