#!/usr/bin/env python

from math import sqrt

def main():
  """ this computes projecteuler.net problem 010 """

  last = 2000000;
  primes = [2, 3]

  test = primes[-1] + 2
  while (test < last):
    if (is_prime(test, primes)):
      primes.append(test);
    test += 2;

  psum = 0
  for prime in (primes):
    psum += prime

  print psum

def is_prime(test, primes):
  root = sqrt(test);

  for i in primes:
    if (i > root):
      return 1;
    if ((test % i) == 0):
      return 0;

if __name__ == "__main__":
    main()
