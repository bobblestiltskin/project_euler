#!/usr/bin/ruby

def is_palindromic(digits)
end

MAX3 = 999
MIN3 = 100
maxp = 0

mini = MIN3
minj = MIN3
maxj = MAX3
(MAX3.downto(mini)).each do |i|
  (maxj.downto(minj)).each do |j|
    product = i * j
    puts(product)
#  if (n % 3) == 0 || (n % 5) == 0 
#    total += n
  end
end

#puts(total)
