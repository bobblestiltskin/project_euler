"use strict"

function next_term(num)
{
  let retval = 0;
  if (num % 2n) 
    retval = num + num + num + 1n;
  else
    retval = num >> 1n;
  return retval;
}

const first = 500000n;
const last = 1000000n;
let max = 0n;
let maxi = 0n;

for (let i=first; i<last; ++i)
{
  let counter = 0n;
  let j = i;
  while (j != 1n)
  {
    j = next_term(j);
    counter++;
  }
  counter++;

  if (counter > max)
  {
    max = counter;
    maxi = i;
  }
}
console.log(Number(maxi));
