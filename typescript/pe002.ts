function pe002(max02:number): number {
  let total:number = 0
  let previous:number = 1
  let current:number = 1

  while (current < max02)
  {
    let next = current + previous
    if (!(current % 2))
      total += current
    previous = current
    current = next
  }

  return total
}

const max02:number = 4000000
console.log(pe002(max02))
