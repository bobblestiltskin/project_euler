"use strict"

let limit = 1000;
let num = BigInt(2 ** limit);
let string = num.toString()

let ssum = 0;
for(let i = 0; i < string.length; i++)
  ssum += Number(string[i])

console.log(ssum)
