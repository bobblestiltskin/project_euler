#!/usr/bin/env python3

""" this computes projecteuler.net problem 021 """

import sys
from math import sqrt

def sum_factors(number):
    total = 1
    for i in range(2, int(sqrt(number))):
        if ((number % i) == 0):
            total += (i + (number // i))

    return total

SIZE = 10000
spd = []
for i in range(SIZE):
    spd.append(sum_factors(i))

result = 0
for i in range(SIZE):
    if (spd[i] < SIZE):
        if (i != spd[i]):
            if (spd[spd[i]] == i):
                result += i

print(result)
sys.exit(0)
