#!/bin/bash
# computes project euler problem 007 in bash
function isprimelist
{
# first parameter is test, second parameter is a list of known primes
# returns 0 if prime , 1 if non-prime
  TEST=$1
  PRIMES=$2
  SQROOT=$(echo "scale=0; sqrt($TEST)" | bc)

  for PRIME in ${PRIMES[@]}
  do
    if [ $PRIME -gt $SQROOT ]
    then
      return 0
    fi
    if [ $(($TEST % $PRIME)) = 0 ]
    then
      return 1
    fi
  done
}
NUMPRIMES=10000
declare -a PRIMES=(2 3)
TEST=5
while [ ${#PRIMES[@]} -le $NUMPRIMES ]
do
  isprimelist $TEST $PRIMES
  if [ $? = 0 ]
  then
    PRIMES+=($TEST)
  fi
  TEST=$(($TEST + 2))
done
echo ${PRIMES[$NUMPRIMES]}
