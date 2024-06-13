#!/bin/bash
# computes project euler problem 004 in bash
function is_palindromic
# passed a 6 digit string, returns 0 if it is palindromic
#                                  1 if not 6 digits or non-palindromic
{
  INPUT=$1
  if [ ${#INPUT} != 6 ]
  then
    return 1
  fi

  REVERSE=$(echo $INPUT | rev)
  if [ $INPUT = $REVERSE ]
  then
    return 0
  else
    return 1
  fi
}

MAX3=999
MIN3=100
MAXP=0
MINI=$MIN3
MINJ=$MIN3
MAXJ=$MAX3
PRODUCT=0

for i in $(seq $MAX3 -1 $MINI)
do
  for j in $(seq $MAXJ -1 $MINJ)
  do
    PRODUCT=$(($i * $j))
    is_palindromic $PRODUCT
    if [ $? = 0 ]
    then
      if [ $PRODUCT -gt $MAXP ]
      then
        MAXP=$PRODUCT
        PDIV=$(( $PRODUCT / 1000))
        MINI=$PDIV
        MINJ=$PDIV
      fi
    fi
  done
  MAXJ=$i
done
echo $MAXP
