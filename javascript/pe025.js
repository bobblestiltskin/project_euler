"use strict"

const limit = 1000;

function fib(n, vector)
{
  // this computes the fibonacci number of the passed number
  if (n < 2)
    vector[vector.length] = n;
  else
    vector[vector.length] = BigInt(vector[n - 2]) + BigInt(vector[n - 1]);
}

let i = 0;
let vector = [];
fib(i, vector);
while (String(vector[vector.length - 1]).length < limit)
{
  i += 1;
  fib(i, vector);
}

console.log(i)
