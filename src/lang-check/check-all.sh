#!/bin/bash

TEST_DIR=`dirname "$0"`

gcc $TEST_DIR/main.c -o main && ./main && rm main
g++ $TEST_DIR/main.cpp -o main && ./main && rm main
go run $TEST_DIR/main.go
runhaskell $TEST_DIR/main.hs
node $TEST_DIR/main.js
python $TEST_DIR/main.py
rustc $TEST_DIR/main.rs && ./main && rm main