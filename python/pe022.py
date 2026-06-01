#!/usr/bin/env python3

""" this computes projecteuler.net problem 022 """

import sys

names = []
with open('../names.txt', 'r', encoding='utf-8') as f:

    name_string = f.read()

    start = 1
    for i in range(len(name_string) - 3):
        if name_string[i] == '"':
            if name_string[i + 1] == ',':
                if name_string[i + 2] == '"':
                    name = name_string[start:i]
                    names.append(name)
                    start = i + 3

    name = name_string[start:len(name_string) - 1]
    names.append(name)
    names.sort()

total = 0
for i in range(len(names)):
    letters = 0
    for j in range(len(names[i])):
        letters += ord(names[i][j]) - 64
    total += letters * (i + 1)

print(total)
sys.exit(0)
