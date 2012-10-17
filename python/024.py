#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 024 """

  start = 123456789
  end = 9876543210

  count = 0
  i = start - 1
  while (i <= end):
    i += 1
    digits = str(i).zfill(10)

    if (digits.find("0") == -1):
      continue

    if (digits.find("1") == -1):
      continue

    if (digits.find("2") == -1):
      continue

    if (digits.find("3") == -1):
      continue

    if (digits.find("4") == -1):
      continue

    if (digits.find("5") == -1):
      continue

    if (digits.find("6") == -1):
      continue

    if (digits.find("7") == -1):
      continue

    if (digits.find("8") == -1):
      continue

    if (digits.find("9") == -1):
      continue
    
    count += 1
    if (count == 1000000):
      break

  print i

  return 0

if __name__ == "__main__":
    main()
