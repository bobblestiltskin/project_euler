#!/usr/bin/env python3

""" this computes projecteuler.net problem 020 """

import sys

LAST = 100
factorial = 1
for i in range(LAST):
    factorial *= i + 1

fstring = str(factorial)
flen = len(fstring)

fsum = 0
for i in range(flen):
    fsum += int(fstring[i])

print(fsum)
sys.exit(0)
