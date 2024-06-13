#!/bin/bash
# computes project euler problem 002 in bash
MAX=4000000
TOTAL=0
PREVIOUS=1
CURRENT=1
while [ $CURRENT -lt $MAX ]; do
  NEXT=$(( $CURRENT + $PREVIOUS ))
  if [ $(($CURRENT % 2)) = 0 ]
  then
    TOTAL=$(($TOTAL + $CURRENT))
  fi
  PREVIOUS=$CURRENT
  CURRENT=$NEXT
done
echo $TOTAL
