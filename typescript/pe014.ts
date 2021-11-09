function next_term(num:bigint): bigint {
  let retval = 0n
  if (num % 2n) 
    retval = num + num + num + 1n
  else
    retval = num >> 1n
  return retval
}

function pe014(): number {
  const first = 500000n
  const last = 1000000n
  let max = 0n
  let maxi = 0n
  
  for (let i=first; i<last; ++i)
  {
    let counter = 0n
    let j = i
    while (j != 1n)
    {
      j = next_term(j)
      counter++
    }
    counter++
  
    if (counter > max)
    {
      max = counter
      maxi = i
    }
  }
  return Number(maxi)
}

console.log(pe014())
