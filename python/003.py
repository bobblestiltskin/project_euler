#!/usr/bin/env python

from math import sqrt

def set_max_prime(big, max_prime):
  is_prime = 1
  count = 3
  while (is_prime and (count**2 < big)):
    if ((big % count) == 0):
      is_prime = 0
    count += 2
  if (is_prime and (big > max_prime)):
    max_prime = big
  return max_prime

def main():
  """ this computes projecteuler.net problem 003 """

  number = 600851475143

  max_prime = 0
  for i in range(2, int(sqrt(number)) + 1):
    if ((number % i) == 0):
      max_prime = set_max_prime(i, max_prime)
      number = number / i
      if (number == 1):
        break

  print max_prime

  return 0

if __name__ == "__main__":
    main()
