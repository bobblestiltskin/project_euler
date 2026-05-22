#!/usr/bin/env python3

""" this computes projecteuler.net problem 014 """

import sys


def next_term(num):
    '''this function halves even input or returns 3n+1'''

    if num % 2:
        retval = num + num + num + 1
    else:
        retval = num >> 1
    return retval


LAST = 1000000
maxv = 0
maxi = 0

for i in range(LAST >> 1, LAST):
    counter = 0
    j = i
    while j != 1:
        j = next_term(j)
        counter += 1
    counter += 1

    if counter > maxv:
        maxv = counter
        maxi = i

print(maxi)

sys.exit(0)
