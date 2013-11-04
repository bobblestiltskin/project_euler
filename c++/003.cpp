// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=3

#include <inttypes.h>
#include <cstdio>
#include <cmath>

int main() {
  uint64_t number = 600851475143ull;
  unsigned int max_prime = 0;
  unsigned int i = 3;
  while (number != 1) {
    if ((number % i)) {
      i += 2;
    } else {
      max_prime = i;
      number = number/i;
    }
  }
  printf("%d\n", max_prime);
  return(0);
}
