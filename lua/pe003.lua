-- this computes projecteuler.net problem 003

local number = 600851475143

local max_prime = 0
local i = 3
while number ~= 1 do
  if number % i == 0 then
    max_prime = i
    number = number / i
  else
    i = 2 + i
  end
end

print(max_prime)
