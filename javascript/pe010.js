"use strict"

const last = 2000000;

function is_prime(test, numprimes, primes)
{
  let root = Math.floor(Math.sqrt(test));
  for (let i=0; i<numprimes; i++)
  {
    if (primes[i] > root)
      return 1;
    if (!(test % primes[i]))
      return 0;
  }
  return 0;
}

let primes = [2];
let numprimes = 1;
let sum = 2;

for (let test = 3; test < last; test+=2)
{
  if (is_prime(test, numprimes, primes))
  {
    primes[numprimes++] = test;
    sum += test;
  }
}

console.log(sum);    
