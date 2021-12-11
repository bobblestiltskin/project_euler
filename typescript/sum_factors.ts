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
