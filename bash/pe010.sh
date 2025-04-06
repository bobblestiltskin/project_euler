#!/bin/bash
# computes project euler problem 010 in bash
#
# due to performance issues I read
#
# We know that any integer number can be written in the form of 6k+i, where k is a non-negative integer (like 0, 1, 2, 3,...) and i is a number between 0 and 5 (so i can be 0, 1, 2, 3, 4, or 5). 
#
#If we look closely, we’ll notice that when i is 0, 2, 3, or 4, the numbers 6k, 6k+2, 6k+3, and 6k+4 are all divisible by either 2 or 3. But prime numbers greater than 3 can't be divisible by 2 or 3. Therefore, the only forms left that a prime number can have are 6k+1 or 6k+5 (since these forms are not divisible by 2 or 3).
#
#Instead of checking every number up to the √n to see if it divides n, we only check numbers of the form 6k+1 and 6k+5. This reduces the number of checks needed
#
#from https://www.geeksforgeeks.org/check-for-prime-number/
#
function isprimelist
{
# first parameter is test, second parameter is a list of known primes
# returns 0 if prime, 1 if non-prime
  TEST=$1
  PRIMES=$2

#  echo 'isprimelist with test of',$TEST

  for PRIME in ${PRIMES[@]}
  do
#    echo 'isprimelist with prime of',$PRIME
    SQUARE=$(($PRIME * $PRIME))
    if [ $SQUARE -gt $TEST ]
    then
      return 0
    fi
    if [ $(($TEST % $PRIME)) -eq 0 ]
    then
      return 1
    fi
  done
}
#MAXPRIME=20
#MAXPRIME=200
MAXPRIME=2000000
declare -a PRIMES=(2 3)
SUM=5
TEST=5
while [ ${PRIMES[-1]} -le $MAXPRIME ]
do
#  echo 'test is ' hi,$TEST,' lastprime is ',${PRIMES[-1]}
  isprimelist $TEST $PRIMES
  if [ $? = 0 ]
  then
    PRIMES+=($TEST)
    SUM=$(($SUM + $TEST))
  else
    NTEST=$(($TEST + 2))
    isprimelist $NTEST $PRIMES
    if [ $? = 0 ]
    then
      PRIMES+=($NTEST)
      SUM=$(($SUM + $NTEST))
    fi
  fi
  TEST=$(($TEST + 6))
done
SUM=$(($SUM - ${PRIMES[-1]}))
echo $SUM
