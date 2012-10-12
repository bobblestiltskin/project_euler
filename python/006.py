#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 006 """

  sumsq = 0
  for i in range(1, 101):
    sumsq += i ** 2

  sqsum = (101 * 50) ** 2
  
  print sqsum -sumsq

  return 0

if __name__ == "__main__":
    main()
