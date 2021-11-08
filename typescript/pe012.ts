function get_num_divisors(num:number): number {
  let counter = 0
  let running = 1
  while (running <= Math.sqrt(num)) { // we get half the divisors before the square root
    if (!(num % running))
      counter++
    running++
  }
  return counter
}

function pe012(): number {
  const LAST = 250
  let num = 0
  let i = 0
  let j = 1
  
  while (num < LAST)
  {
    i = i + j
    num = get_num_divisors(i)
    j++
  }
  return i
}

console.log(pe012())
