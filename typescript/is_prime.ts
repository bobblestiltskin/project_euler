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
