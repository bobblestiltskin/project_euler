-- this computes projecteuler.net problem 019

local cycle = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
         31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

local count = 0
local dow = 2  -- start on tuesday 1901.1.1
         -- 2000 is a leap year too!
for i = 1, 25 do
  for j = 1, 48 do
    if dow == 0 then
      count = 1 + count
    end
    dow = (dow + cycle[j]) % 7
  end
end
print(count)
