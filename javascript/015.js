"use strict"

const max = 20;

// need to compute 2n!/((n!)*(n!))

let numerator = new Array(max);
let denominator = new Array(max);

for (let i = 0; i < max; i++)
{
  denominator[i] = i+1;
  numerator[i] = i+max+1;
}

// walk through lists and cast away multiples to reduce size of numbers from factorials

for (let i=0; i < max; i++)
{
  for (let j=0; j < max; j++)
  {
    if ((denominator[i] != 1) && (!(numerator[j] % denominator[i])))
    {
      numerator[j] = numerator[j] / denominator[i];
      denominator[i] = 1;
    }
  }
}

let num = 1;
let denom = 1;
for (let i=0; i < max; i++)
{
  num *= numerator[i];
  denom *= denominator[i];
}

console.log(num/denom);
