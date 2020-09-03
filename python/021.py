#!/usr/bin/env python3

from math import sqrt

def main():
  """ this computes projecteuler.net problem 021 """

  SIZE = 10000
  spd = []
  for i in range(SIZE):
    spd.append(sum_factors(i))

  result = 0
  for i in range(SIZE):
    if (spd[i] < SIZE):
      if (i != spd[i]):
        if (spd[spd[i]] == i):
          result += i

  print(result)
  return 0

def sum_factors(number):
  total = 1
  for i in range (2, int(sqrt(number))):
    if ((number % i) == 0):
      total += (i + (number // i))

  return total

if __name__ == "__main__":
    main()
