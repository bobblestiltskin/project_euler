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
LAST=1000000
MAX=0
MAXI=0

for i in $(seq $START $LAST)
{
  COUNTER=0
  j=$i
  while [ $j != 1 ];
  do
    j=$(next_term $j)
    COUNTER=$(($COUNTER+1))
  done
  COUNTER=$(($COUNTER+1))
  echo $i $COUNTER $MAX
  if [ $COUNTER -gt $MAX ]
  then
    MAX=$COUNTER
    MAXI=$i
  fi
}
echo $MAXI
