#!/usr/bin/env python
import argparse

def main():
  """ this computes projecteuler.net problem 001 """
  parser = argparse.ArgumentParser()
  parser.add_argument("limit", type=int, help="Upper limit to which we compute factors of 3 and 5")

  args = parser.parse_args()
  print 'UPPER LIMIT is', args.limit

  total = 0

  for i in range(args.limit):
    if (((i % 3) == 0) or ((i % 5) == 0)):
      total += i 

  print 'total is', total
  return 0

if __name__ == "__main__":
    main()
