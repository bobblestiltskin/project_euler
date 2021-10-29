function is_prime(test:number, numprimes:number, primes:Array<number>): boolean {
  let root:number = Math.floor(Math.sqrt(test));
  for (let i=0; i<numprimes; i++)
  {
    if (primes[i] > root)
      return true
    if (!(test % primes[i]))
      return false
  }
  return false
}

function pe007(primenum:number): number {
  let primes:Array<number> = [2, 3]
  let numprimes:number = 2

  let test:number = 5
  while (numprimes < primenum)
  {
    if (is_prime(test, numprimes, primes))
      primes[numprimes++] = test
    test += 2
  }

  return primes[numprimes-1]
}

const primenum = 10001;

console.log(pe007(primenum));    
