#!/usr/bin/env python3

""" this computes projecteuler.net problem 007 """

import sys
from common import is_prime


PRIMENUM = 10001
primes = [2, 3]

test = primes[-1] + 2
while len(primes) < PRIMENUM:
    if is_prime(test, primes):
        primes.append(test)
    test += 2

print(primes[-1])
sys.exit(0)
