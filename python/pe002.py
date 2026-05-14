#!/usr/bin/env python3

""" this computes projecteuler.net problem 002 """

import sys

LIMIT = 4000000
TOTAL = 0
PREVIOUS = 1
CURRENT = 1
while CURRENT < LIMIT:
    NEXT = CURRENT + PREVIOUS
    if (CURRENT % 2) == 0:
        TOTAL += CURRENT
    PREVIOUS = CURRENT
    CURRENT = NEXT

print(TOTAL)
sys.exit(0)
