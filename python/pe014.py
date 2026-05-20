#!/usr/bin/env python3

""" this computes projecteuler.net problem 014 """

import sys


def next_term(num):

    if (num % 2):
        retval = num + num + num + 1
    else:
        retval = num >> 1
    return retval


last = 1000000
maxv = 0
maxi = 0

for i in range(last >> 1, last):
    counter = 0
    j = i
    while (j != 1):
        j = next_term(j)
        counter += 1
    counter += 1

    if (counter > maxv):
        maxv = counter
        maxi = i

print(maxi)

sys.exit(0)
