#!/usr/bin/ruby

number = 600851475143
max_prime = 0
i = 3

while number != 1 do
  if (number % i) == 0
    max_prime = i
    number /= i
  else
    i += 2
  end
end

puts(max_prime)
