#!/usr/bin/ruby

LIMIT = 4000000
total = 0
previous = 1
current = 1

while current < LIMIT do
  nextv = current + previous
  if (current % 2) == 0
    total += current
  end
  previous = current
  current = nextv
end

puts(total)
