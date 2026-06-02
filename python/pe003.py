#!/usr/bin/env python3

""" this computes projecteuler.net problem 003 """

import sys

number = 600851475143

max_prime = 0
i = 3
while number != 1:
    if (number % i) == 0:
        max_prime = i
        number = number / i
    else:
        i += 2

print(max_prime)

sys.exit(0)
