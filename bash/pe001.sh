#!/bin/bash
# computes project euler problem 001 in bash
LAST=999
TOTAL=0
for i in $(seq 0 $LAST)
do
  if [ $(($i % 3)) = 0 ] || [ $(($i % 5)) = 0 ]
  then
    TOTAL=$(($TOTAL + $i))
  fi
done
echo $TOTAL
