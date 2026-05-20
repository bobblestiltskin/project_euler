#!/usr/bin/env python3

""" this computes projecteuler.net problem 005 """

import sys


def isprime(num):
    """is_prime returns true or 1 if num is prime,
                        false or 0, if not"""
    if num % 2:
        if num < 8:
            if num == 1:
                return 0
            return 1
        divisor = 3
        while divisor * divisor <= num:
            if num % divisor == 0:
                return 0
            divisor += 2
        return 1
    return num == 2


MAX = 20
i = 2
TRY_PRODUCT = 1
TOTAL = 1
while i <= MAX:
    if isprime(i):
        if TRY_PRODUCT:
            if (i * i) > MAX:
                TRY_PRODUCT = 0
            else:
                TMP = i
                LAST = TMP
                while TMP <= MAX:
                    LAST = TMP
                    TMP *= i
                TOTAL *= LAST
        if TRY_PRODUCT == 0:
            TOTAL *= i
    i += 1
print(TOTAL)

sys.exit(0)
