#!/usr/bin/env python3

""" this computes projecteuler.net problem 002 """

import sys

LIMIT = 4000000
total = 0
previous = 1
current = 1
while current < LIMIT:
    NEXT = current + previous
    if (current % 2) == 0:
        total += current
    previous = current
    current = NEXT

print(total)
sys.exit(0)
