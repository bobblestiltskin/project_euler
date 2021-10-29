function pe006(imax:number): number {
  let sumsq:number = 0
  for (let i=0;i<imax;++i)
    sumsq += (i+1) * (i+1)

  let sqsum:number = ((imax + 1) * (imax >> 1)) * ((imax + 1) * (imax >> 1))

  return sqsum - sumsq
}

const imax:number = 100

console.log(pe006(imax));
