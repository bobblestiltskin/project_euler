#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 002 """

  limit = 4000000
  total = 0
  i = 0
  vector = []
  fibi = fib(i, vector)
  while (fibi < limit):
    if ((fibi % 2) == 0):
      total += fibi 
    i += 1
    fibi = fib(i, vector)

  print total
  return 0

def fib(n, vector):
  """ this computes the fibonacci number of the passed number """
  if n < 2:
    vector.append(n)
  else:
    vector.append(vector[n - 2] + vector[n - 1])

  return vector[n]

if __name__ == "__main__":
    main()
