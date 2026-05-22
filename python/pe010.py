#!/usr/bin/env python3

""" this computes projecteuler.net problem 010 """

import sys
from common import is_prime


LAST = 2000000
primes = [2]

psum = 2
for test in range(3, LAST, 2):
    if is_prime(test, primes):
        primes.append(test)
        psum += test

print(psum)
sys.exit(0)
