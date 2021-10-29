function is_prime(test:number, numprimes:number, primes:Array<number>): boolean {
  let root = Math.floor(Math.sqrt(test))
  for (let i=0; i<numprimes; i++)
  {
    if (primes[i] > root)
      return true
    if (!(test % primes[i]))
      return false
  }
  return false
}

function pe010(last:number): number {
  let primes:Array<number> = [2]
  let numprimes:number = 1
  let sum:number = 2
  
  for (let test = 3; test < last; test+=2)
  {
    if (is_prime(test, numprimes, primes))
    {
      primes[numprimes++] = test
      sum += test
    }
  }
  return sum
}

const last:number = 2000000

console.log(pe010(last))
