#!/usr/bin/env python3

""" this computes projecteuler.net problem 001 """

import sys

IMAX = 1000
total = 0

for i in range(IMAX):
    if (i % 3) == 0 or (i % 5) == 0:
        total += i

print(total)
sys.exit(0)
