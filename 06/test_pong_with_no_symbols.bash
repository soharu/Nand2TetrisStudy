#!/usr/bin/env bash
pushd hack_assembler
cargo build --release
popd
assembler="./hack_assembler/target/release/hack_assembler"
input="input/pong/PongL.asm"
expected="result/pong/PongL.hack"

echo "[`date +%Y/%m/%d_%H:%M:%S`] Check ${input}..."
${assembler} ${input} | diff ${expected} -;
echo "[`date +%Y/%m/%d_%H:%M:%S`] Done"
