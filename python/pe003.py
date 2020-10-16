#!/usr/bin/env python3

from math import sqrt

def main():
  """ this computes projecteuler.net problem 003 """

  number = 600851475143

  max_prime = 0
  i = 3
  while (number != 1):
    if ((number % i) == 0):
      max_prime = i
      number = number / i
    else:
      i+= 2

  print(max_prime)

  return 0

if __name__ == "__main__":
    main()
