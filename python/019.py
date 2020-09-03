#!/usr/bin/env python3

def main():
  """ this computes projecteuler.net problem 019 """

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
  print(count)

  return 0

if __name__ == "__main__":
    main()
