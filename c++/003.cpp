// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=3

#include <inttypes.h>
#include <cstdio>
#include <cmath>

void set_max_prime(const uint64_t big, unsigned int* max_prime_ptr)
{
  bool is_prime = 1;
  unsigned int count = 3;
  while (is_prime && ((count*count) < big)) {
    if (!(big % count))
      is_prime = 0;
    count = count + 2;
  }
  if (is_prime && ((unsigned int) big > *max_prime_ptr))
    *max_prime_ptr = (unsigned int) big;
}

int main() {
  uint64_t number = 600851475143ull;
  unsigned int max_prime = 0;
  unsigned int i = 3;
  while (number != 1) {
    if ((number % i)) {
      i += 2;
    } else {
      set_max_prime(i, &max_prime);
      number = number/i;
    }
  }
  printf("%d\n", max_prime);
  return(0);
}
