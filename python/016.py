#!/usr/bin/env python
import argparse

def main():
  """ this computes projecteuler.net problem 016 """
  parser = argparse.ArgumentParser()
  parser.add_argument("limit", type=int, help="Power of two limit")

  args = parser.parse_args()
  print 'UPPER LIMIT is', args.limit

  num = 2 ** args.limit
  print 'NUM is',num

  ssum = 0
  string = str(num)
  for i in range(0, len(string)):
    ssum += int(string[i])
  print 'SUM is',ssum

  return 0

if __name__ == "__main__":
    main()
