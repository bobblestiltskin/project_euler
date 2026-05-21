""" this provides common functions """

from math import sqrt


def is_prime(test, primes):
    """this function returns True if test is prime"""
    root = sqrt(test)

    for i in primes:
        if i > root:
            return True
        if (test % i) == 0:
            return False
    return False
