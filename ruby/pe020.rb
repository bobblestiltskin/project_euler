#!/usr/bin/ruby

last = 100
factorial = 1
(1 .. last).each do |i|
  factorial *= i
end

fsum = 0
fstring = factorial.to_s
fstring.split('').each do |i|
  fsum += i.to_i
end

puts(fsum)
