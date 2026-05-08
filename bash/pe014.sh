#!/bin/bash
function next_term(){
  num=$1

  if [ $(($num % 2)) == 0 ]
  then
     echo $(($num >> 1))
  else
     echo $(($num + $num + $num +1))
  fi
}

START=500000
LAST=500100
#LAST=1000000
MAX=0
MAXI=0

for i in $(seq $START $LAST)
{
#  echo $i
  COUNTER=0
  j=$i
  while [ $j != 1 ];
  do
#    echo $j
    j=$(next_term $j)
    COUNTER=$(($COUNTER+1))
#    echo $j $COUNTER
  done
  COUNTER=$(($COUNTER+1))
  echo $i $COUNTER $MAX
  if [ $COUNTER -gt $MAX ]
  then
    MAX=$COUNTER
    MAXI=$i
#  else
#    echo $i $COUNTER $MAX
  fi
}
echo $MAXI
