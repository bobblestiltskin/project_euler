#!/usr/bin/ruby

def is_prime(test, primes)
  root = Math.sqrt(test)

  primes.each do |i|
    if i > root
      return true
    end
    if test % i == 0
      return false
    end
  end
end

primenum = 10001
primes = Array[2, 3]

test = 5
while (primes.length < primenum)
  if (is_prime(test, primes))
    primes.push(test)
  end
  test += 2
end

puts(primes[-1])
