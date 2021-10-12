#!/usr/bin/ruby

def fib(n, vector)
  if n < 2
    vector.push(n)
  else
    vector.push(vector[n - 2] + vector[n - 1])
  end
end

limit = 1000
i = 0
vector = Array.new
fib(i, vector)
while vector[i].to_s.length < limit
  i += 1
  fib(i, vector)
end

puts(i)
