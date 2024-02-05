-- this computes projecteuler.net problem 003

number = 600851475143

max_prime = 0
i = 3
while number ~= 1 do
    if number % i == 0 then
      max_prime = i
      number = number / i
    else
      i = 2 + i
    end
end

print(max_prime)
