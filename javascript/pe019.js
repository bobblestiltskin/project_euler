"use strict"

let cycle = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
             31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
             31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
             31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

let count = 0;
let dow = 2; // start on tuesday 1901.1.1
for (let i = 0; i < 25; ++i) // 2000 is a leap year too!
{
  for (let j = 0; j < 48; ++j) // 48 months in 4 year cycle
  {
    if (!dow)
      count++;
    dow = (dow + cycle[j]) % 7;
  }
}
console.log(count);
