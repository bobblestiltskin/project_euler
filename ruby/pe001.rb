#!/usr/bin/ruby

IMAX = 1000
total = 0

(0 ... IMAX).each do |n|
  if (n % 3) == 0 || (n % 5) == 0 
    total += n
  end
end

puts(total)
