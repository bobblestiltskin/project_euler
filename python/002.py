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
  fibi = fib(i)
  while (fibi < args.limit):
    if ((fibi % 2) == 0):
      total += fibi 
    i += 1
    fibi = fib(i)

  print 'total is', total
  return 0

def fib(n):
  """ this computes the fibonacci number of the passed number """
  if n < 2:
    return n
  else:
    return (fib(n - 1) + fib(n - 2))

if __name__ == "__main__":
    main()
