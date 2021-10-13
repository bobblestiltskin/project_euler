#!/usr/bin/ruby

def sum_factors(number)
  asum = 1
  limit = Math.sqrt(number).to_i
  (2 .. limit).each do |i|
    if number % i == 0
      divisor = number / i
      asum += i
      if i != divisor
        asum += divisor
      end
    end
  end
  return asum
end

MAX = 28123
abundant = Array.new
adictionary = Hash.new

(1 ... MAX).each do |i|
  fsum = sum_factors(i)
  if i < fsum
    abundant.push(i)
    adictionary[i] = fsum
  end
end

asum = 0
(1 ... abundant[0]).each do |i|
  asum += i
end
(abundant[0] ... MAX).each do |i|
  addi = true
  abundant.each do |j|
    if j >= i
      break
    end
    diff = i - j
    if adictionary.has_key?(diff)
      addi = false
      break
    end
  end
  if addi
    asum += i
  end
end

puts(asum)
