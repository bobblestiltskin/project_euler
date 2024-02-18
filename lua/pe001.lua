-- this computes projecteuler.net problem 001 
local imax = 1000
local total = 0

for i = 1, imax - 1 do
  if i % 3 == 0 or i % 5 == 0 then
    total = total + i 
  end
end

print(total)
