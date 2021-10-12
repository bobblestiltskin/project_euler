#!/usr/bin/ruby

cycle = Array[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
           31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
           31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
           31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

count = 0
dow = 2  # start on tuesday 1901.1.1
         # 2000 is a leap year too!
(0 ... 25).each do |i|
  cycle.each do |j|
    if dow == 0
      count += 1
    end
    dow = (dow + j) % 7
  end
end

puts(count)
