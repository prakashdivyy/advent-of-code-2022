mkdir solve
cd solve
awk -v RS= '{print > ("split-" NR ".txt")}' ../input.txt
for f in *.txt; do
  awk '{ sum += $1 } END { print sum }' $f >> result
done
echo "Part 1:" && cat result | sort -n | tail -n 1
echo "Part 2:" && cat result | sort -n | uniq | tail -n 3 | paste -sd+ | bc
cd ../
rm -rf solve