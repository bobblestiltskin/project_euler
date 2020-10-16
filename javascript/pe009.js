"use strict"

const stop = 1000;

for (let a = 1; a < stop; a++) {
  for (let b = a + 1; b < stop; b++) {
    for (let c = b + 1; c < stop; c++) {
      if ((a + b +c) === stop) {
        if ((a * a) + (b * b) === (c * c)) {
          console.log(a*b*c);
        }
      }
    }
  }
}
