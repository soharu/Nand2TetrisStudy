#!/usr/bin/env bash
pushd hack_assembler
cargo build --release
popd

assembler="./hack_assembler/target/release/hack_assembler"

input_files=(
    "input/max/Max.asm"
    "input/rect/Rect.asm"
)

result_files=(
    "result/max/Max.hack"
    "result/rect/Rect.hack"
)

for i in ${!input_files[@]}; do
    echo "Check ${input_files[$i]}..."
    ${assembler} ${input_files[$i]} | diff ${result_files[$i]} -;
    echo "Done"
done
