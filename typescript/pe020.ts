function pe020(last:number): number {
  let factorial = 1n

  for(let i=0; i < last; i++)
    factorial *= BigInt(i+1)

  let fstring = factorial.toString()
  let flen = fstring.length

  let fsum = 0
  for(let i=0; i < flen; i++)
    fsum += Number(fstring[i])
  return fsum
}

let last = 100
console.log(pe020(last))
