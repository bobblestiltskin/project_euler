#!/usr/bin/env python3

""" this computes projecteuler.net problem 003 """

import sys

NUMBER = 600851475143

MAX_PRIME = 0
i = 3
while NUMBER != 1:
    if (NUMBER % i) == 0:
        MAX_PRIME = i
        NUMBER = NUMBER / i
    else:
        i += 2

print(MAX_PRIME)

sys.exit(0)
