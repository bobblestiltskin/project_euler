"use strict"

const SIZE = 10000;

function sum_factors(number)
{
  let sum = 1;
  for (let i = 2; i <= Math.sqrt(number); ++i)
    if (!(number % i))
      sum += (i + (number / i));

  return sum;
}

let sumproperdivisors = new Array(SIZE);
for (let i=0; i<SIZE ; i++)
  sumproperdivisors[i] = sum_factors(i);

let total = 0;
for (let i=0; i<SIZE ; i++)
  if ((sumproperdivisors[i] < SIZE) && (i != sumproperdivisors[i]) && (sumproperdivisors[sumproperdivisors[i]] == i))
    total += i;

console.log(total);
