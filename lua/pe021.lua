-- this computes projecteuler.net problem 021

local SIZE = 10000
local spd = {}

local function sum_factors(number)
  local total = 1
  for i = 2, math.floor(math.sqrt(number)) do
    if (number % i) == 0 then
      total = i + math.floor(number / i) + total
    end
  end
  return total
end

for i = 1, SIZE do
  spd[i] = sum_factors(i)
end

local result = 0
for i = 1, SIZE do
  if spd[i] < SIZE then
    if i ~= spd[i] then
      if spd[spd[i]] == i then
        result = i + result
      end
    end
  end
end

print(result)
