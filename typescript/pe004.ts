function is_palindromic(digits:Array<string>): boolean {
  let len:number = digits.length

  for (let i=0;i<len;i++) /* only really need to test half of the string - if even and int(half)+1 if odd  - but more complexity */
    if (digits[i] != digits[len-(i+1)])
      return false

  return true
}

function pe004(imin:number, imax:number, maxdigits:number): number {
  let maxp:number = 0
  let mini:number = imin
  let minj:number = imin
  let maxj:number = imax

  for (let i = imax; i >= mini; i--)
  {
    for (let j = maxj; j >= minj; j--)
    {
      let product:number = i * j
      let digits:Array<string> = product.toString().split("", maxdigits)
      if (is_palindromic(digits))
        if (product > maxp)
        {
          maxp = product
          mini = minj = product / 1000 // optimize
        }
    }
    maxj = i
  }
  return maxp
}

const MAX3:number = 999;
const MIN3:number = 100;
const MAXDIGITS:number = 6;

console.log(pe004(MIN3, MAX3, MAXDIGITS));
