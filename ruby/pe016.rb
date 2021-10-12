#!/usr/bin/ruby

limit = 1000
num = 2 ** limit

ssum = 0
numstring = num.to_s

numstring.split('').each do |s|
  ssum += s.to_i
end

puts(ssum)
