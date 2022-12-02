node solve.js
awk '{ sum += $1 } END { print sum }' output.txt >> result
echo "Part 1:" && cat result
rm -rf output.txt result