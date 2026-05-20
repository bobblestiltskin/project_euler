#!/usr/bin/env python3

""" this computes projecteuler.net problem 016 """

import sys

LIMIT = 1000
NUM = 2 ** LIMIT

SSUM = 0
STRING = str(NUM)
for _, char in enumerate(STRING):
    SSUM += int(char)
print(SSUM)

sys.exit(0)
