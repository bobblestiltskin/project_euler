#!/usr/bin/env python
import argparse
from math import sqrt

def main():
  """ this computes projecteuler.net problem 01 """
  parser = argparse.ArgumentParser()
  parser.add_argument("last", type=int, help="number of divisors")

  args = parser.parse_args()
  args.last = args.last >> 1;
  print 'LIMIT is', args.last

  num = 0
  i = 0
  j = 1

  while (num < args.last):
    i = i + j
    num = get_num_divisors(i)
    j += 1
    print "I is",i,"and J is ",j,"and NUM is ",num

  print "I is",i,"and J is ",j-1,"and NUM is ",num
  return 0

def get_num_divisors(num):
  counter = 0
  running = 1
  while (running <= sqrt(num)):
    if (not (num % running)):
      counter += 1
    running += 1
  return counter

if __name__ == "__main__":
    main()
