function pe016(limit:number): number {
  let num = BigInt(2 ** limit)
  let string = num.toString()

  let ssum = 0
  for(let i = 0; i < string.length; i++)
    ssum += Number(string[i])
  return ssum
}

let limit = 1000
console.log(pe016(limit))
