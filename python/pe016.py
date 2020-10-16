#!/usr/bin/env python3

def main():
  """ this computes projecteuler.net problem 016 """

  limit = 1000
  num = 2 ** limit

  ssum = 0
  string = str(num)
  for i in range(0, len(string)):
    ssum += int(string[i])
  print(ssum)

  return 0

if __name__ == "__main__":
    main()
