function sum_factors(num:number): number {
  let sum = 1
  for (let i = 2; i <= Math.sqrt(num); ++i)
  {
    if (!(num % i))
    {
      let divisor = num / i
      sum += i
      if (i != divisor)
        sum += divisor
    }
  }
  return sum
}

function pe023(): number {
  const MAX = 28123

  let abundant = new Array(MAX)

  let ab_count = 0
  for (let i = 1; i < MAX; ++i)
  {
    if (i < sum_factors(i))
      abundant[ab_count++] = i;  
  }
   
  let sum = 0n
  for (let i = 1; i < MAX; ++i)
  {
    let addi = 0
    for (let j = 0; j < ab_count; ++j)
    {
      if (i < abundant[j])
      {
        addi = 1
        break
      }
      let diff = i - abundant[j]
      let klast = 0
      for (let k = 0; k < ab_count; ++k)
      {
        if (abundant[k] == diff)
        {
          klast = 1
          break
        }
      }
      if (klast)
        break
    }
    if (addi)
      sum += BigInt(i)
  }
  return Number(sum)
}

console.log(pe023())
