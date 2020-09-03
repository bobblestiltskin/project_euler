"use strict"

const primenum = 10001;

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

let primes = [2, 3];
let numprimes = 2;

let test = 5;
while (numprimes < primenum)
{
  if (is_prime(test, numprimes, primes))
    primes[numprimes++] = test;
  test += 2;
}

console.log(primes[numprimes-1]);    
