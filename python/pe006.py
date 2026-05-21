#!/usr/bin/env python3

""" this computes projecteuler.net problem 006 """

import sys

sumsq = 0
for i in range(1, 101):
    sumsq += i ** 2

SQSUM = (101 * 50) ** 2

print(SQSUM - sumsq)

sys.exit(0)
