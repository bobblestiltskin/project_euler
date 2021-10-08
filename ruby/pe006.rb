#!/usr/bin/ruby

IMAX = 101
sumsq = 0

(1 ... IMAX).each do |i|
  sumsq += i ** 2
end

sqsum = (101 * 50) ** 2

puts(sqsum - sumsq)
