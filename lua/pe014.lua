-- this computes projecteuler.net problem 014

local first = 500000
local last = 1000000
local maxv = 0
local maxi = 0

function next_term(num)
  local retval = 0
  if num % 2  == 1 then
    retval = num + num + num + 1
  else
    retval = num >> 1
  end
  return retval
end
  
for i = first, last do
  local counter = 0
  local j = i
  while j ~= 1 do
    j = next_term(j)
    counter = 1 + counter
  end
  counter = 1 + counter

  if counter > maxv then
    maxv = counter
    maxi = i
  end
end

print(maxi)
