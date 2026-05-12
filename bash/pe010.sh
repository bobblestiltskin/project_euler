#!/usr/bin/bash
SUM=0
for x in $(primesieve 1 2000000 -p)
do
#   echo $x
   SUM=$(($SUM + $x))
done
echo $SUM
