#!/usr/bin/env python3

from math import sqrt

def main():
  """ this computes projecteuler.net problem 010 """

  last = 2000000;
  primes = [2]

  psum = 2
  for test in range(3, last, 2):
    if (is_prime(test, primes)):
      primes.append(test);
      psum += test

  print(psum)

def is_prime(test, primes):
  root = sqrt(test);

  for i in primes:
    if (i > root):
      return 1;
    if ((test % i) == 0):
      return 0;

if __name__ == "__main__":
    main()
