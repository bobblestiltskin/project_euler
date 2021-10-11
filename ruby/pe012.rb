#!/usr/bin/ruby

def get_num_divisors(num)
  counter = 0
  running = 1
  root = Math.sqrt(num)
  while running <= root
    if num % running == 0
      counter += 1
    end
    running += 1
  end
  return counter
end

last = 250
num = 0
i = 0
j = 1

while (num < last)
  i = i + j
  num = get_num_divisors(i)
#  puts("num is #{num}, i is #{i}, j is #{j}")
  j += 1
end

puts(i)
