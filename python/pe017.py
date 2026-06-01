#!/usr/bin/env python3

""" this computes projecteuler.net problem 017 """

import sys

ONEK = "one thousand"
HCOUNT = 7  # "hundred"
HANDCOUNT = 10  # "hundred and "

units = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine"]

tens = ["ten", "eleven", "twelve", "thirteen",
        "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
        "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour",
        "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
        "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour",
        "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
        "forty", "fortyone", "fortytwo", "fortythree", "fortyfour",
        "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
        "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour",
        "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
        "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour",
        "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
        "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour",
        "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
        "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour",
        "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
        "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour",
        "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"]

count = 0

for i in units:
    count += len(i)

for i in tens:
    count += len(i)

for i in units:
    leni = len(i)
    count += leni + HCOUNT
    for j in units:
        count += leni + HANDCOUNT + len(j)
    for j in tens:
        count += leni + HANDCOUNT + len(j)

count += len(ONEK) - 1  # contains a space
print(count)

sys.exit(0)
