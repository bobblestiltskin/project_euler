#!/usr/bin/env python

def isprime(num):
  if (num % 2):
    if (num < 8):
      if (num == 1):
        return 0
      else:
        return 1
    else:
      divisor = 3;
      while ((divisor * divisor) <= num):
        if ((num % divisor) == 0):
          return 0
        divisor += 2
      return 1
  else:
    return (num == 2)

def main():
  """ this computes projecteuler.net problem 005 """

  MAX=20
  i = 2
  try_product = 1
  total = 1
  while (i <= MAX):
    if (isprime(i)):
      if (try_product):
        if ((i * i) > MAX):
          try_product = 0
        else:
          tmp = i
          last = tmp
          while (tmp <= MAX):
            last = tmp
            tmp *= i
          total *= last
      if (try_product == 0):
        total *= i
    i += 1
  print total

  return 0

if __name__ == "__main__":
    main()
