#!/usr/bin/env python
import argparse

def main():
  """ this computes projecteuler.net problem 002 """
  parser = argparse.ArgumentParser()
  parser.add_argument("limit", type=int, help="Upper limit to which we sum even fibonacci numbers")

  args = parser.parse_args()
  print 'UPPER LIMIT is', args.limit

  total = 0
  i = 0
  vector = []
  fibi = fib(i, vector)
  while (fibi < args.limit):
    if ((fibi % 2) == 0):
      total += fibi 
    i += 1
    fibi = fib(i, vector)

  print 'total is', total
  return 0

def fib(n, vector):
  """ this computes the fibonacci number of the passed number """
  if n < 2:
    vector.append(n);
  else:
    vector.append(vector[n - 2] + vector[n - 1]);

  return vector[n];

if __name__ == "__main__":
    main()
