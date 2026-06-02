#!/usr/bin/bash
# computes project euler problem 010 in bash
SUM=0
for x in $(primesieve 1 2000000 -p)
do
   SUM=$(($SUM + $x))
done
echo $SUM
