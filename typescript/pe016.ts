function pe016(limit16:number): number {
  let num = BigInt(2 ** limit16)
  let string = num.toString()

  let ssum = 0
  for(let i = 0; i < string.length; i++)
    ssum += Number(string[i])
  return ssum
}

let limit16 = 1000
console.log(pe016(limit16))
