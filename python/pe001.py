#!/usr/bin/env python3

""" this computes projecteuler.net problem 001 """

import sys

IMAX = 1000
TOTAL = 0

for i in range(IMAX):
    if (((i % 3) == 0) or ((i % 5) == 0)):
        TOTAL += i

print(TOTAL)
sys.exit(0)
