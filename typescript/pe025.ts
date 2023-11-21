function fib(n:number, vector:Array<bigint>): void {
  // this computes the fibonacci number of the passed number
  if (n < 2)
    vector[vector.length] = BigInt(n)
  else
    vector[vector.length] = BigInt(vector[n - 2]) + BigInt(vector[n - 1])
}

function pe025(limit25:number): number {
  let i = 0
  let vector = []
  fib(i, vector)
  while (String(vector[vector.length - 1]).length < limit25)
  {
    i += 1
    fib(i, vector)
  }
  return i
}

const limit25 = 1000

console.log(pe025(limit25))
