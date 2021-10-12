#!/usr/bin/ruby

def next_term(num)
  if num % 2 == 1
    return num + num + num + 1
  else
    return num >> 1
  end
end

last = 1000000
maxv = 0
maxi = 0

(last >> 1 ... last).each do |i|
  counter = 0
  j = i
  while j != 1
    j = next_term(j)
    counter += 1
  end

  if counter > maxv
    maxv = counter
    maxi = i
  end
end

puts(maxi)
