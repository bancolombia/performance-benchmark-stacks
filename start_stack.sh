#!/bin/bash
docker kill $(docker ps -q)
cd performance-benchmark-stacks
STACK=$1
docker build -t stack "$STACK"
docker run -d -p 8080:8080 stack