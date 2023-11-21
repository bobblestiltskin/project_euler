function pe006(imax06:number): number {
  let sumsq:number = 0
  for (let i=0;i<imax06;++i)
    sumsq += (i+1) * (i+1)

  let sqsum:number = ((imax06 + 1) * (imax06 >> 1)) * ((imax06 + 1) * (imax06 >> 1))

  return sqsum - sumsq
}

const imax06:number = 100

console.log(pe006(imax06));
