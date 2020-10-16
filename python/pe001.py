#!/usr/bin/env python3

def main():
  """ this computes projecteuler.net problem 001 """

  imax = 1000
  total = 0

  for i in range(imax):
    if (((i % 3) == 0) or ((i % 5) == 0)):
      total += i 

  print(total)
  return 0

if __name__ == "__main__":
    main()
