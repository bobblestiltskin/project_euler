#!/usr/bin/env python3

""" this computes projecteuler.net problem 025 """

import sys


def fib(n, vector):
    """ this computes the fibonacci number of the passed number """
    if n < 2:
        vector.append(n)
    else:
        vector.append(vector[n - 2] + vector[n - 1])


LIMIT = 1000
i = 0
vector = []
fib(i, vector)
while len(str(vector[i])) < LIMIT:
    i += 1
    fib(i, vector)

print(i)
sys.exit(0)
