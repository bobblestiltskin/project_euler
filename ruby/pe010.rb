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

last = 2000000
primes = Array[2]

psum = 2
(3 ... last).each do |n|
  if (is_prime(n, primes))
    primes.push(n)
    psum += n
  end
  n += 2
end

puts(psum)
