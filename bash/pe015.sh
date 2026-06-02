#!/usr/bin/bash
# computes project euler problem 015 in bash

MAX=20
LAST=19

# need to compute 2n!/((n!)*(n!))

declare -a numerator=(21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40)
declare -a denominator=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)

for i in $(seq 0 $LAST)
do
  for j in $(seq 0 $LAST)
  do
    if [ ${denominator[i]} -ne 1 ] && [ $(( ${numerator[j]} % ${denominator[i]} )) -eq 0 ]
    then
      numerator[j]=$(( numerator[j] / denominator[i] ))
      denominator[i]=1
    fi
  done
done

num=1
denom=1
for i in $(seq 0 $LAST)
do
  num=$(( $num * ${numerator[i]} ))
  denom=$(( $denom * ${denominator[i]} ))
done
echo $(( $num / $denom))
