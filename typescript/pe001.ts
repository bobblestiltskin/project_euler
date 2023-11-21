function pe001(imax01:number): number {
  let total:number = 0

  for (var i=0; i < imax01; i++)
    if (!(i % 3) || !(i % 5))
      total += i  
  return total
}

const imax01:number = 1000
console.log(pe001(imax01))
