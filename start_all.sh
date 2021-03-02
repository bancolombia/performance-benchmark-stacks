#!/bin/bash

stacks=( "nodejs/express" "nodejs/nestjs" )

for stack in "${stacks[@]}"
do
  echo "Starting $stack"
  ./start.sh "$stack" &
done

wait
echo "All stacks terminated"