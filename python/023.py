#!/usr/bin/env python

from math import sqrt

def main():
  """ this computes projecteuler.net problem 023 """

  MAX = 28123
  abundant = []
  for i in range(1, MAX):
    if (i < sum_factors(i)):
      abundant.append(i)

  asum = 0
  for i in range(1, MAX):
    addi = 0
    for j in abundant:
      if (i < j):
        addi = 1
        break
      diff = i - j
      if (abundant.count(diff)):
        break
    if (addi):
      asum += i

  print asum
  return 0

def sum_factors(number):
  asum = 1
  for i in range(2, int(sqrt(number)) + 1):
    if ((number % i) == 0):
      divisor = number / i
      asum += i
      if (i != divisor):
        asum += divisor
  return asum

if __name__ == "__main__":
    main()
