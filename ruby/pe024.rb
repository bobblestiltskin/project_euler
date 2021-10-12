#!/usr/bin/ruby

#  9! is 362880 so after all the 10 digit numbers which 
#  start with 0 or 1 we will have passed 725760 of the 
#  combinations. The millionth combination will start
#  with a 2, since we need to count 274240 more combinations
#  after 2000000000.
#
#  8! is 40320, so there are that many 10 digit combinations starting 20.
#  The combination starting 22 is invalid (since the numerals must be
#  distinct), so we could count 6 sets of combinations of 40320 up to
#  2700000000 and then we would have seen 725760+241920 leaving 32320 to
#  find.
#
#  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
#  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

start = 2780000000
stop   = 9876543210

count = 725760 + 241920 + 30240
i = start - 1
while i <= stop
  i += 1
  digits = i.to_s.rjust(10, '0')

  if digits.include?("0") &&
     digits.include?("1") &&
     digits.include?("2") &&
     digits.include?("3") &&
     digits.include?("4") &&
     digits.include?("5") &&
     digits.include?("6") &&
     digits.include?("7") &&
     digits.include?("8") &&
     digits.include?("9")

    count += 1
    if count == 1000000
      break
    end
  end
end

puts(i)
