"use strict"

const fs = require("fs");
let name_string = fs.readFileSync("../names.txt", "ascii");

let j = 0;
let names = [];
let start = 1;
for(let i = 0; i < name_string.length - 3; i++)
  if (name_string[i] == '"')
    if (name_string[i+1] == ',')
      if (name_string[i+2] == '"')
      {
        let name = name_string.slice(start,i);
        names[j++] = name;
        start = i + 3;
      }

let name = name_string.slice(start,name_string.length-1);
names[j++] = name;
names.sort()

let total = 0n;
for(let i = 0; i < names.length; i++)
{
  let letters = 0;
  for(let j = 0; j < names[i].length; j++)
    letters += names[i][j].toString().charCodeAt() - 64;
  total += BigInt(letters * (i+1));
}
console.log(Number(total));
