function sum_factors(num:number): number {
  let sum = 1
  for (let i = 2; i <= Math.sqrt(num); ++i)
    if (!(num % i))
      sum += (i + (num / i))

  return sum
}

function pe021(): number {
  const SIZE = 10000
  
  let sumproperdivisors = new Array(SIZE)
  for (let i=0; i<SIZE ; i++)
    sumproperdivisors[i] = sum_factors(i)
  
  let total = 0
  for (let i=0; i<SIZE ; i++)
    if ((sumproperdivisors[i] < SIZE) && (i != sumproperdivisors[i]) && (sumproperdivisors[sumproperdivisors[i]] == i))
      total += i
  
  return total
}

console.log(pe021())
