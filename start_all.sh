#!/bin/bash

stacks=("nodejs/express" "nodejs/nestjs" "java/spring-boot-tomcat" "java/spring-boot-tomcat")

for stack in "${stacks[@]}"; do
  echo "Starting $stack"
  #  ./start.sh "$stack" &
done

wait
echo "All stacks terminated"

cd reports
./start.sh
