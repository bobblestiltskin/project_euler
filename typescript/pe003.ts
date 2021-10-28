function pe003(num:number): number {
  let max_prime:number = 0
  let i:number = 3

  while (num != 1)
  {
    if (num % i)
      i+=2;
    else
    {
      max_prime = i;
      num = num/i;
    }
  }
  return max_prime
}

let num:number = 600851475143
console.log(pe003(num));
