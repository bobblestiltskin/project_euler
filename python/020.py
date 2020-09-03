#!/usr/bin/env python3

from math import sqrt

def main():
  """ this computes projecteuler.net problem 020 """
  
  last = 100
  factorial = 1
  for i in range(last):
    factorial *= i+1

  fstring = str(factorial)
  flen = len(fstring) 
        
  fsum = 0
  for i in range(flen): 
    fsum += int(fstring[i])

  print(fsum)

if __name__ == "__main__":
    main()
