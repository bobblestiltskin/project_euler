#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 014 """

  last = 1000000
  maxv = 0
  maxi = 0

  for i in range(last >> 1, last):
    counter = 0
    j = i
    while (j != 1):
      j = next_term(j)
      counter += 1
    counter += 1

    if (counter > maxv):
      maxv = counter
      maxi = i
  print maxi

  return 0
  
def next_term(num):

  if (num % 2):
    retval = num + num + num + 1
  else: 
    retval = num >> 1
  return retval

if __name__ == "__main__":
    main()
