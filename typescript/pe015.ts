function pe015(max15:number): number {
  // need to compute 2n!/((n!)*(n!))

  let numerator = new Array(max15)
  let denominator = new Array(max15)

  for (let i = 0; i < max15; i++)
  {
    denominator[i] = i+1
    numerator[i] = i+max15+1
  }

  // walk through lists and cast away multiples to reduce size of numbers from factorials

  for (let i=0; i < max15; i++)
  {
    for (let j=0; j < max15; j++)
    {
      if ((denominator[i] != 1) && (!(numerator[j] % denominator[i])))
      {
        numerator[j] = numerator[j] / denominator[i]
        denominator[i] = 1
      }
    }
  }

  let num = 1
  let denom = 1
  for (let i=0; i < max15; i++)
  {
    num *= numerator[i]
    denom *= denominator[i]
  }

  return num/denom
}

const max15 = 20
console.log(pe015(max15))
