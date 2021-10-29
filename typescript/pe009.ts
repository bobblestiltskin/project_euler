function pe009(final:number): number {
  for (let a = 1; a < final; a++) {
    for (let b = a + 1; b < final; b++) {
      for (let c = b + 1; c < final; c++) {
        if ((a + b +c) === final) {
          if ((a * a) + (b * b) === (c * c)) {
            return a*b*c
          }
        }
      }
    }
  }
  return 0
}

const final:number = 1000

console.log(pe009(final))
