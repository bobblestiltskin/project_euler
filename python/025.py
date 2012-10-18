#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 025 """

  limit = 1000
  i = 0
  vector = []
  fib(i, vector)
  while (len(str(vector[i])) < limit):
    i += 1
    fib(i, vector)

  print i
  return 0

def fib(n, vector):
  """ this computes the fibonacci number of the passed number """
  if n < 2:
    vector.append(n)
  else:
    vector.append(vector[n - 2] + vector[n - 1])

if __name__ == "__main__":
    main()
