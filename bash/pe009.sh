#!/bin/bash
# computes project euler problem 009 in bash
STOP=1000
for i in $(seq 1 $STOP)
do
  for j in $(seq $(($i + 1)) $STOP)
  do
    for k in $(seq $(($j + 1)) $STOP)
    do
      if [ $(($i + $j + $k)) = $STOP ]
      then
        ISQUARED=$(($i * $i))
        JSQUARED=$(($j * $j))
        KSQUARED=$(($k * $k))
        if [ $(($ISQUARED + $JSQUARED)) = $KSQUARED ]
        then
          PRODUCT=$(($i * $j * k))
          echo $PRODUCT
          exit 0
        fi
      fi
    done
  done
done
exit 1
