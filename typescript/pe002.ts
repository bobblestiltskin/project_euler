function pe002(max:number): number {
  let total:number = 0
  let previous:number = 1
  let current:number = 1

  while (current < max)
  {
    let next = current + previous
    if (!(current % 2))
      total += current
    previous = current
    current = next
  }

  return total
}

const max:number = 4000000
console.log(pe002(max))
