#!/bin/bash
# computes project euler problem 010 in bash
function isprimelist
{
# first parameter is test, second parameter is a list of known primes
# returns 0 if prime , 1 if non-prime
  TEST=$1
  PRIMES=$2

  for PRIME in ${PRIMES[@]}
  do
    if [ $(($PRIME * $PRIME)) -gt $TEST ]
    then
      return 0
    fi
    if [ $(($TEST % $PRIME)) = 0 ]
    then
      return 1
    fi
  done
}
MAXPRIME=2000000
declare -a PRIMES=(2 3)
SUM=5
TEST=5
while [ ${PRIMES[-1]} -le $MAXPRIME ]
do
  isprimelist $TEST $PRIMES
  if [ $? = 0 ]
  then
    PRIMES+=($TEST)
    SUM=$(($SUM + $TEST))
  fi
  TEST=$(($TEST + 2))
done
SUM=$(($SUM - ${PRIMES[-1]}))
echo $SUM
