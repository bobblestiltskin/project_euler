#!/usr/bin/ruby

last = 100
factorial = 1
(0 ... last).each do |i|
  factorial *= i+1
end

fsum = 0
fstring = factorial.to_s
fstring.split('').each do |i|
  fsum += i.to_i
end

puts(fsum)
