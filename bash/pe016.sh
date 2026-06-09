#!/usr/bin/bash

#computes projecteuler.net problem 016 in bash

export BC_LINE_LENGTH=400
LIMIT=1000
NUM=$(echo 2^${LIMIT} | bc)

SSUM=0
for i in $(seq 0 $((${#NUM} - 1)))
do
  SSUM=$(($SSUM + ${NUM:$i:1}))
done
echo $SSUM
