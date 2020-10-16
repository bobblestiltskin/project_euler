#!/usr/bin/env python3

def main():
  """ this computes projecteuler.net problem 015 """

# need to compute 2n!/((n!)*(n!))

  limit = 20
  numerator = []
  denominator = []
  for i in range(limit):
    denominator.append(i+1)
    numerator.append(i+limit+1)

#  walk through lists and cast away multiples to reduce size of numbers from
#  factorials - this is incomplete factoring but sufficient for this problem
#  we could factor both completely if we wanted...

  for i in (denominator):
    for j in (numerator):
      if ((i != 1) and ((j % i) == 0)):
        j = j / i
        i = 1

  num = 1
  denom = 1
  for i in range(limit):
    num *= numerator[i]
    denom *= denominator[i]
      
  print(num//denom)
  return 0

if __name__ == "__main__":
    main()
