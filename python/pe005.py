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
try_product = 1
total = 1
while i <= MAX:
    if isprime(i):
        if try_product:
            if (i * i) > MAX:
                try_product = 0
            else:
                tmp = i
                last = tmp
                while tmp <= MAX:
                    last = tmp
                    tmp *= i
                total *= last
        if try_product == 0:
            total *= i
    i += 1
print(total)

sys.exit(0)
