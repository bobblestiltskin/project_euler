#!/usr/bin/env python3

""" this computes projecteuler.net problem 010 """

import sys
from math import sqrt


def is_prime(test, primes):
    root = sqrt(test)

    for i in primes:
        if (i > root):
            return 1
        if ((test % i) == 0):
            return 0


last = 2000000
primes = [2]

psum = 2
for test in range(3, last, 2):
    if (is_prime(test, primes)):
        primes.append(test)
        psum += test

print(psum)
sys.exit(0)
