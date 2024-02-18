-- this computes projecteuler.net problem 002
local limit = 4000000
local total = 0
local previous = 1
local current = 1
while current < limit do
  next = current + previous
  if current % 2 == 0 then
    total = total + current 
  end
  previous = current
  current = next
end

print(total)
