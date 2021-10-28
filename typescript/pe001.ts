function pe001(imax:number): number {
  let total:number = 0

  for (var i=0; i < imax; i++)
    if (!(i % 3) || !(i % 5))
      total += i  
  return total
}

const imax:number = 1000
console.log(pe001(imax))
