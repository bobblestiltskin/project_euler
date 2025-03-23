#/usr/bin/bash
# computes project euler problem 012 in bash
# we know that half of the divisors are before the square root
# so we halve the problem size
function get_num_divisors() {
  num=$1
  counter=0
  running=1
  root=$(echo "sqrt($num)" | bc)
  while [ $running -le $root ]
  do
    if [ $(($num % $running)) == 0 ]
    then
      counter=$(($counter + 1))
    fi
    running=$(($running + 1))
  done
  echo $counter
}

last=250
num=0
i=0
j=1
while [ $num -lt $last ]
do
  i=$(($i + $j))
  num=$(get_num_divisors $i)
#  echo "i is $i, j is $j, num is $num"
  j=$(($j + 1))
done

echo $i
