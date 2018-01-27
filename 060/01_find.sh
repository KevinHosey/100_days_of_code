#!/bin/bash
# Search a directory for certain file type

arr=(pdf doc txt)
findargs=()

for t in "${arr[@]}"; do
    findargs+=(-name "*.$t" -o)
done

find . -type f \( "${findargs[@]}" -false \)
