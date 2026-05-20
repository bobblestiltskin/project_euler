#!/usr/bin/env python3

""" this computes projecteuler.net problem 009 """

import sys

stop = 1000
for a in range(1, stop):
        for b in range(a + 1, stop):
            for c in range(b + 1, stop):
                if (a + b + c == stop):
                    if ((a * a) + (b * b) == (c * c)):
                        print(a * b * c)
                        sys.exit(0)
sys.exit(1)
