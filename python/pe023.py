#!/usr/bin/env python3

""" this computes projecteuler.net problem 023 """

import sys

from math import sqrt


def sum_factors(number):
    asum = 1
    for i in range(2, int(sqrt(number)) + 1):
        if ((number % i) == 0):
            divisor = number / i
            asum += i
            if (i != divisor):
                asum += divisor
    return asum


MAX = 28123
abundant = []
adictionary = {}
for i in range(1, MAX):
    fsum = sum_factors(i)
    if (i < fsum):
        abundant.append(i)
        adictionary[i] = fsum

asum = 0
for i in range(1, abundant[0]):
    asum += i
for i in range(abundant[0], MAX):
    addi = 1
    for j in abundant:
        if (j >= i):
            break
        diff = i - j
        if diff in adictionary:
            addi = 0
            break
    if (addi):
        asum += i

print(asum)
sys.exit(0)
