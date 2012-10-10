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
#ifdef DEBUG
      printf("FACTOR of %lu is (%lu * %lu)\n", number, i, divi);
#endif
      uint64_t j;
      for (j = 2; j < sqrt(i); j++) {
        if (!(i % j)) {
#ifdef DEBUG
          printf("2 FACTOR of %lu is (%lu * %lu)\n", i, j, i/j);
#endif
          matched_2 = 1;
        }
      }
      uint64_t k;
      for (k = 2; k < sqrt(divi); k++) {
        if (!(divi % k)) {
#ifdef DEBUG
          printf("3 FACTOR of %lu is (%lu * %lu)\n", divi, k, divi/k);
#endif
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
#ifdef DEBUG
  printf("MAX PRIME DIVISOR of %lu is ", number);
#endif
  printf("%lu\n", max_prime);
  return(0);
}
