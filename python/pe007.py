#!/usr/bin/env python3

from math import sqrt

def main():
  """ this computes projecteuler.net problem 007 """
  primenum = 10001
  primes = [2, 3]

  test = primes[-1] + 2
  while (len(primes) < primenum):
    if (is_prime(test, primes)):
      primes.append(test);
    test += 2;

  print(primes[-1])

def is_prime(test, primes):
  root = sqrt(test);

  for i in primes:
    if (i > root):
      return 1;
    if ((test % i) == 0):
      return 0;

if __name__ == "__main__":
    main()
