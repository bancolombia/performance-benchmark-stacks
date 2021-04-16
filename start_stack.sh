#!/bin/bash
docker kill "$(docker ps -q)"
cd performance-benchmark-stacks
STACK=$1
LANGUAGE=${STACK%%/*}
docker build -t stack -f "$STACK/Dockerfile" "$LANGUAGE"
docker stop stack || true && docker rm stack || true
docker run -d --name stack -p 8080:8080 stack
