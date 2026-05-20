#!/usr/bin/env python3

""" this computes projecteuler.net problem 004 """

import sys


def is_palindromic(digits):
    """This function returns 1 for palindromic input"""
    slen = len(digits)

    for k in range(slen):
        if digits[k] != digits[slen - (k + 1)]:
            return 0

    return 1


MAX3 = 999
MIN3 = 100
MAXP = 0

MINI = MIN3
MINJ = MIN3
MAXJ = MAX3
for i in range(MAX3, MINI, -1):
    for j in range(MAXJ, MINJ, -1):
        PRODUCT = i * j
        if is_palindromic(str(PRODUCT)):
            if PRODUCT > MAXP:
                MAXP = PRODUCT
                MINJ = PRODUCT // 1000
                MINI = PRODUCT // 1000
    MAXJ = i

print(MAXP)

sys.exit(0)
