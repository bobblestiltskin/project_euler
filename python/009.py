#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 009 """

  stop = 1000
  for a in range(1,stop):
    for b in range(a+1,stop):
      for c in range(b+1,stop):
        if (a+b+c == stop):
          if ((a*a)+(b*b) == (c*c)):
            print a*b*c
            exit(0)
  exit(1)

if __name__ == "__main__":
    main()
