#!/bin/bash
mkdir solve
cd solve
split -l 1 ../input.txt
for f in x*; do
    var=$(cat $f)
    f1="${var:0:${#var}/2}"
    f2="${var:${#var}/2}"

    for (( i=0; i<${#f1}; i++ )); do
        ch="${f1:$i:1}"
        res=$(echo $f2 | grep "$ch")
        if [[ $res ]]; then
            # echo "$ch"
            ord=$(echo $ch | tr -d "\n" | od -An -t uC | bc)
            if [ "$ord" -gt 96 ]; then
                num=$((ord-96))
            else
                num=$((ord-38))
            fi
            echo "$num" >> result
            break
        fi
    done
done
result1=$(awk '{ sum += $1 } END { print sum }' result)
echo "Part 1: $result1"
cd ../
rm -rf solve

