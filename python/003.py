#!/usr/bin/env python

from math import sqrt

def main():
  """ this computes projecteuler.net problem 003 """

  number = 600851475143

  max_prime = 0
  for i in range(2, int(sqrt(number)) + 1):
    matched_2 = 0
    matched_3 = 0
    divi = 0
    if ((number % i) == 0):
      divi = number/i
      print "FACTOR of",number,"is (",i," * ",divi,")"
      for j in range(2, int(sqrt(i)) + 1):
        if ((i % j) == 0):
          print "2 FACTOR of",i,"is (",j," * ",i/j,")"
          matched_2 = 1
      for k in range(2, int(sqrt(divi)) + 1):
        if ((divi % k) == 0):
          print "3 FACTOR of",divi,"is (",k," * ",divi/k,")"
          matched_3 = 1
    if divi:
      if ((matched_2 == 0) and (i > max_prime)):
        max_prime = i
      if ((matched_3 == 0) and (divi > max_prime)):
        max_prime = divi

  print "MAX PRIME divisor of",number,"is",max_prime

  return 0

if __name__ == "__main__":
    main()
