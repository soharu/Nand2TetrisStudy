#!/usr/bin/env bash
pushd hack_assembler
cargo build --release
popd

assembler="./hack_assembler/target/release/hack_assembler"

input_files=(
    "input/add/Add.asm"
    "input/max/MaxL.asm"
    "input/rect/RectL.asm"
)

result_files=(
    "result/add/Add.hack"
    "result/max/MaxL.hack"
    "result/rect/RectL.hack"
)

for i in ${!input_files[@]}; do
    echo "Check ${input_files[$i]}..."
    ${assembler} ${input_files[$i]} | diff ${result_files[$i]} -;
    echo "Done"
done
