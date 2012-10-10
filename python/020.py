#!/usr/bin/env python

import argparse
from math import sqrt

def main():
  """ this computes projecteuler.net problem 020 """
  parser = argparse.ArgumentParser()
  parser.add_argument("last", type=int, help="factorial to compute and sum digits of")

  args = parser.parse_args()
  
  factorial = 1
  for i in range(args.last):
    factorial *= i+1

  fstring = str(factorial)
  flen = len(fstring) 
        
  fsum = 0
  for i in range(flen): 
    fsum += int(fstring[i])

  print "SUM is",fsum

if __name__ == "__main__":
    main()
