#!/usr/bin/env python3

""" this computes projecteuler.net problem 12 """

import sys
from math import sqrt


def get_num_divisors(number):
    '''this function compute the number of divisors of the passed number'''
    counter = 0
    running = 1
    while running <= sqrt(number):
        if not number % running:
            counter += 1
        running += 1
    return counter


LAST = 250
num = 0
i = 0
j = 1

while num < LAST:
    i = i + j
    num = get_num_divisors(i)
    j += 1

print(i)

sys.exit(0)
