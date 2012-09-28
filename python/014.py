#!/usr/bin/env python
import argparse

def main():
  """ this computes projecteuler.net problem 014 """
  parser = argparse.ArgumentParser()
  parser.add_argument("last", type=int, help="Upper limit")

  args = parser.parse_args()
  print 'UPPER LIMIT is', args.last

  max = 0
  maxi = 0

  for i in range(args.last >> 1, args.last):
    counter = 0
    j = i
    while (j != 1):
      j = next_term(j)
      counter += 1
    counter += 1
    print 'I is',i,'and COUNTER is',counter

    if (counter > max):
      max = counter
      maxi = i
  print 'IMAX is',maxi,'and MAX is',max

  return 0
  
def next_term(num):

  if (num % 2):
    retval = num + num + num + 1
  else: 
    retval = num >> 1
  return retval

if __name__ == "__main__":
    main()
