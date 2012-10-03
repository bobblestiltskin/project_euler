#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 019 """

# You are given the following information, but you may prefer to do some research for yourself.

#     1 Jan 1900 was a Monday.
#     Thirty days has September,
#     April, June and November.
#     All the rest have thirty-one,
#     Saving February alone,
#     Which has twenty-eight, rain or shine.
#     And on leap years, twenty-nine.
#    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

  cycle = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
           31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
           31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
           31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  count = 0
  dow = 2  # start on tuesday 1901.1.1
           # 2000 is a leap year too!
  for i in range(25):
     for j in range(len(cycle)):
        if (dow == 0):
          count += 1
        dow = (dow + cycle[j]) % 7
  print 'COUNT is', count

  return 0

if __name__ == "__main__":
    main()
