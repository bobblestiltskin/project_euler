#!/usr/bin/env python

import argparse
from math import sqrt

def main():
  """ this computes projecteuler.net problem 010 """
  parser = argparse.ArgumentParser()
  parser.add_argument("last", type=int, help="ordinal of the prime to find")

  args = parser.parse_args()
  primes = [2, 3]

  test = primes[-1] + 2
  while (test < args.last):
    if (is_prime(test, primes)):
      primes.append(test);
    test += 2;

  psum = 0
  for prime in (primes):
    psum += prime

  print "SUM of all primes less than",args.last,"is",psum

def is_prime(test, primes):
  root = sqrt(test);

  for i in primes:
    if (i > root):
      return 1;
    if ((test % i) == 0):
      return 0;

if __name__ == "__main__":
    main()
