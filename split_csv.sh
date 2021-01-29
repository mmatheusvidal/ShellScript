#!/bin/bash

echo "Dividindo em 50000"

echo $(date +%T)

cd ~/Downloads/
FILENAME=FILE.csv
header=$(head -1 $FILENAME)
split -l 50000 $FILENAME tmp
n=1
for f in tmp*
do
   echo $header > Part${n}.csv
   cat $f >> Part${n}.csv
   rm $f
   ((n++))
done
sed -i '1d' Part1

echo $(date +%T)
echo "Fim do Split"