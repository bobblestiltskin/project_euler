function isprime(num:number): boolean {
  if (num % 2) {
    if (num < 8) {
      return !(num === 1)
    } else {
      let divisor:number = 3
      while ((divisor * divisor) <= num) {
        if (!(num % divisor))
          return false
        divisor += 2
      }
      return true
    }
  } else {
    return num === 2
  }
}

function pe005(maxval:number): number {
  let i:number = 2
  let total:number = 1
  let try_product:boolean = true

  while (i <= maxval) {
    if (isprime(i)) {
      if (try_product) {
        if ((i * i) > maxval) {
          try_product = false
        } else {
          let tmp = i
          let last = tmp
          while (tmp <= maxval) {
            last = tmp
            tmp *= i
          }
          total *= last
        }
      }
      if (!(try_product))
        total *= i
    }
    i++
  }
  return total
}

const MAX:number = 20;

console.log(pe005(MAX));
