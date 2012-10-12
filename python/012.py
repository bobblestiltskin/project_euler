#!/usr/bin/env python
from math import sqrt

def main():
  """ this computes projecteuler.net problem 12 """

  last = 500 / 2
  num = 0
  i = 0
  j = 1

  while (num < last):
    i = i + j
    num = get_num_divisors(i)
    j += 1

  print i
  return 0

def get_num_divisors(num):
  counter = 0
  running = 1
  while (running <= sqrt(num)):
    if (not (num % running)):
      counter += 1
    running += 1
  return counter

if __name__ == "__main__":
    main()
