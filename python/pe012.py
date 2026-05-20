#!/usr/bin/env python3

""" this computes projecteuler.net problem 12 """

import sys
from math import sqrt


def get_num_divisors(num):
    counter = 0
    running = 1
    while (running <= sqrt(num)):
        if (not (num % running)):
            counter += 1
        running += 1
    return counter


last = 250
num = 0
i = 0
j = 1

while (num < last):
    i = i + j
    num = get_num_divisors(i)
    j += 1

print(i)

sys.exit(0)
