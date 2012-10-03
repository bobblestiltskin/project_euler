// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=3

#include <cstdint>
#include <cstdio>
#include <cmath>

int main() {
  const uint64_t number = 600851475143;

  uint64_t max_prime = 0;
  uint64_t i;
  for (i = 2; i < sqrt(number); ++i) {
    int matched_2 = 0;
    int matched_3 = 0;
    uint64_t divi = 0;
    if (!(number % i)) {
      divi = number/i;
      printf("FACTOR of %lu is (%lu * %lu)\n", number, i, divi);
      uint64_t j;
      for (j = 2; j < sqrt(i); j++) {
        if (!(i % j)) {
          printf("2 FACTOR of %lu is (%lu * %lu)\n", i, j, i/j);
          matched_2 = 1;
        }
      }
      uint64_t k;
      for (k = 2; k < sqrt(divi); k++) {
        if (!(divi % k)) {
          printf("3 FACTOR of %lu is (%lu * %lu)\n", divi, k, divi/k);
          matched_3 = 1;
        }
      }
    }
    if (divi) {
      if (!matched_2 && (i > max_prime))
        max_prime = i;
      if (!matched_3 && (divi > max_prime))
        max_prime = divi;
    }
  }
  printf("MAX PRIME DIVISOR of %lu is %lu\n", number, max_prime);
  return(0);
}
