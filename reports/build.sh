#!/bin/bash

cd front || exit
node build-data.js
echo "Report generated"
npm run build
rm -rf ../../docs/*
mv dist/front/* ../../docs