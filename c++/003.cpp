// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=3

#include <inttypes.h>
#include <cstdio>
#include <cmath>

void set_max_prime(const uint64_t big, int* max_prime_ptr)
{
  int is_prime = 1;
  int count = 3;
  while (is_prime && ((count*count) < big)) {
    if (!(big % count))
      is_prime = 0;
    count = count + 2;
  }
  if (is_prime && ((int) big > *max_prime_ptr))
    *max_prime_ptr = (int) big;
}

int main() {
  const uint64_t number = 600851475143;

  int max_prime = 0;
  for (int i = 2; i < sqrt(number); ++i) {
    if (!(number % i)) {
      uint64_t divi = number/i;
      set_max_prime(i, &max_prime);
      set_max_prime(divi, &max_prime);
    }
  }
  printf("%d\n", max_prime);
  return(0);
}
