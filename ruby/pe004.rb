#!/usr/bin/ruby

def is_palindromic(digits)
  len = digits.length
  (0 ... len - 1).each do |i|
    if digits[i,1] != digits[len-(i+1),1]
      return false
    end
  end
  return true
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
    if is_palindromic(product.to_s)
      if product > maxp
        maxp = product
        mini = product / 1000
        minj = product / 1000
      end
    end
  end
  maxj = i       
end

puts(maxp)
