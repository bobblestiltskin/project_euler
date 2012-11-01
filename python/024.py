#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 024 """

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
  end   = 9876543210

  count = 725760 + 241920 + 30240
  i = start - 1
  while (i <= end):
    i += 1
    digits = str(i).zfill(10)

    if (digits.find("0") == -1):
      continue

    if (digits.find("1") == -1):
      continue

    if (digits.find("2") == -1):
      continue

    if (digits.find("3") == -1):
      continue

    if (digits.find("4") == -1):
      continue

    if (digits.find("5") == -1):
      continue

    if (digits.find("6") == -1):
      continue

    if (digits.find("7") == -1):
      continue

    if (digits.find("8") == -1):
      continue

    if (digits.find("9") == -1):
      continue
    
    count += 1
    if (count == 1000000):
      break

  print i

  return 0

if __name__ == "__main__":
    main()
