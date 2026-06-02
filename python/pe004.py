#!/usr/bin/env python3

""" this computes projecteuler.net problem 004 """

import sys


def is_palindromic(digits):
    """This function returns True for palindromic input"""
    slen = len(digits)

    for k in range(slen):
        if digits[k] != digits[slen - (k + 1)]:
            return False

    return True


MAX3 = 999
MIN3 = 100

maxp = 0
mini = MIN3
minj = MIN3
maxj = MAX3
for i in range(MAX3, mini, -1):
    for j in range(maxj, minj, -1):
        product = i * j
        if is_palindromic(str(product)):
            if product > maxp:
                maxp = product
                minj = product // 1000
                mini = product // 1000
    maxj = i

print(maxp)

sys.exit(0)
