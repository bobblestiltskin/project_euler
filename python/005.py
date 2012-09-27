#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 005 """

  primes = [2, 3, 5, 7, 11, 13, 17, 19]

# maximum power of 2 in 1..20 is 16 or 2^4
# maximum power of 3 in 1..20 is 9 or 3^2
# maximum power of other primes < 20 is n^1

# we initialise the result to the powers of 2 and 3 above 1

  result = 2 * 2 * 2 * 3
  for i in range(len(primes)):
    result *= primes[i]

  print 'RESULT is',result

  return 0

if __name__ == "__main__":
    main()
