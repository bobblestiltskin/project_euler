-- this computes projecteuler.net problem 006

local sumsq = 0
for i = 1, 100 do
  sumsq = i * i + sumsq
end

local sum = (101 * 50)
local sqsum = sum * sum
  
print(sqsum - sumsq)
