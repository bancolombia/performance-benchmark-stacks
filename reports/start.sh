#!/bin/bash

cd front || exit
node build-data.js
echo "Report generated"
npm start
