#!/usr/bin/ruby

def sum_factors(number)
  total = 1
  (2 ... Math.sqrt(number).to_i).each do |i|
    if number % i == 0
      total += (i + (number / i))
    end
  end
  return total
end

SIZE = 10000
spd = Array[]
(0 ... SIZE).each do |i|
  spd.push(sum_factors(i))
end

result = 0
(0 ... SIZE).each do |i|
  if spd[i] < SIZE
    if i != spd[i]
      if spd[spd[i]] == i
        result += i
      end
    end
  end
end

puts(result)
