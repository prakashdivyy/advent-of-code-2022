node solve.js
awk '{ sum += $1 } END { print sum }' output.txt >> result
awk '{ sum += $1 } END { print sum }' output2.txt >> result2
echo "Part 1:" && cat result
echo "Part 2:" && cat result2
rm -rf output.txt output2.txt result result2