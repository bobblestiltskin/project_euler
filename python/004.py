#!/usr/bin/env python

def main():
  """ this computes projecteuler.net problem 004 """

  MAX3 = 999
  MIN3 = 100
  maxp = 0

  mini = MIN3
  minj = MIN3
  for i in range(MAX3, mini, -1):
    for j in range(MAX3, minj, -1):
      product = i * j
      if is_palindromic(str(product)):
        print 'PALINDROME',product,'of',i,'*',j 
        if product > maxp:
          maxp = product
#          minj = product / 1000 ## hmm how to get range to honour these resets
#          mini = product / 1000 ## It is not safe to modify the sequence being iterated over in the loop - from tutorial!

  print 'MAXP is',maxp

  return 0

def is_palindromic(digits):
  slen = len(digits)

  for i in range(slen):
    if (digits[i] != digits[slen-(i+1)]):
      return 0

  return 1

if __name__ == "__main__":
    main()
