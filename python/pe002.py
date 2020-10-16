#!/usr/bin/env python3

def main():
  """ this computes projecteuler.net problem 002 """

  limit = 4000000
  total = 0
  previous = 1
  current = 1
  while (current < limit):
    next = current + previous
    if ((current % 2) == 0):
      total += current 
    previous = current
    current = next

  print(total)
  return 0

if __name__ == "__main__":
    main()
