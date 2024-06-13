#!/bin/bash
# computes project euler problem 006 in bash
SUMSQ=0
for i in $(seq 1 100)
do
  SUMSQ=$(($SUMSQ + $(($i * $i)) ))
done
SUM=$((101 * 50)) 
SQSUM=$(($SUM * $SUM)) 
echo $(($SQSUM - $SUMSQ))
