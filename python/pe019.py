#!/usr/bin/env python3

""" this computes projecteuler.net problem 019 """

import sys

cycle = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
         31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

count = 0
dow = 2  # start on tuesday 1901.1.1
# 2000 is a leap year too!
for i in range(25):
    for j in cycle:
        if dow == 0:
            count += 1
        dow = (dow + j) % 7

print(count)

sys.exit(0)
