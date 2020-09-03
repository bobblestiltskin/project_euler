"use strict"

let sumsq = 0;
for (let i=0;i<100;++i)
  sumsq += (i+1) * (i+1);

let sqsum = (101 * 50) * (101 * 50);

console.log(sqsum - sumsq);
