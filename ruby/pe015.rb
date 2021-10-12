#!/usr/bin/ruby

limit = 20
numerator = Array[]
denominator = Array[]
(0 ... limit).each do |i|
   denominator.push(i+1)
   numerator.push(i+limit+1)
end

denominator.each do |i|
  numerator.each do |j|
    if i != 1 and j % i == 0
      j = j / i
      i = 1
    end
  end
end

num = 1
numerator.each do |i|
  num *= i
end

denom = 1
denominator.each do |i|
  denom *= i
end

puts(num/denom)
