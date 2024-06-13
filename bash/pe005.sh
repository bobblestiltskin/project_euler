#!/bin/bash
# computes project euler problem 005 in bash
function isprime
{
# return 0 for prime, 1 for non-prime
  NUM=$1
  if [ $(($NUM % 2)) = 1 ]
  then
    if [ $NUM -lt 8 ]
    then
      if [ $NUM = 1 ]
      then
        return 1
      else
        return 0
      fi
    else 
      DIVISOR=3
      while [ $(( $DIVISOR * $DIVISOR )) -le $NUM ]
      do
        if [ $(( $NUM % $DIVISOR)) = 0 ]
        then
          return 1
        fi
        DIVISOR=$(( $DIVISOR + 2))
      done
      return 0
    fi
  else
    if [ $NUM = 2 ]
    then
      return 0
    else
      return 1
    fi
  fi
  return 0
}

MAX=20
TOTAL=1

i=2
try_product=1

while [ $i -lt $MAX ]
do
  isprime $i
  if [ $? == 0 ]
  then
    if [ $try_product == 1 ]
    then
      if [ $(($i * $i)) -gt $MAX ]
      then
        try_product=0
      else
        TMP=$i
        LAST=$TMP
        while [ $TMP -le $MAX ]
        do
          LAST=$TMP
          TMP=$(($TMP * $i))
        done
        TOTAL=$(($TOTAL * $LAST))
      fi
    fi
    if [ $try_product == 0 ]
    then
      TOTAL=$(($TOTAL * $i))
    fi
  fi
  i=$(($i + 1))
done
echo $TOTAL
