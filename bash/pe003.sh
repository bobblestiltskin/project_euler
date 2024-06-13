#!/bin/bash
# computes project euler problem 003 in bash
NUMBER=600851475143
MAX_PRIME=0
DIVISOR=3
while [ $NUMBER != 1 ];
do
  if [ $(($NUMBER % $DIVISOR)) = 0 ]
  then
    MAX_PRIME=$DIVISOR
    NUMBER=$(($NUMBER / $DIVISOR))
  else
    DIVISOR=$(($DIVISOR + 2))
  fi
done
echo $MAX_PRIME
