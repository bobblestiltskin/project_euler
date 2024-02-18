-- this computes projecteuler.net problem 12

local function get_num_divisors(num)
  counter = 0
  running = 1
  while running <= math.sqrt(num) do
    if (num % running) == 0 then
      counter = 1 + counter
    end
    running = 1 + running
  end
  return counter
end

local last = 250
local num = 0
local i = 0
local j = 1

while num < last do
  i = i + j
  num = get_num_divisors(i)
  j = 1 + j
end

print(i)
