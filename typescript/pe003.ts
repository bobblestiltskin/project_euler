function pe003(num03:number): number {
  let max_prime:number = 0
  let i:number = 3

  while (num03 != 1)
  {
    if (num03 % i)
      i+=2;
    else
    {
      max_prime = i;
      num03 = num03/i;
    }
  }
  return max_prime
}

let num03:number = 600851475143
console.log(pe003(num03));
