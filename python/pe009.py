#!/usr/bin/env python3

""" this computes projecteuler.net problem 009 """

import sys

STOP = 1000
for a in range(1, STOP):
    for b in range(a + 1, STOP):
        for c in range(b + 1, STOP):
            if a + b + c == STOP:
                if (a * a) + (b * b) == (c * c):
                    print(a * b * c)
                    sys.exit(0)
sys.exit(1)
