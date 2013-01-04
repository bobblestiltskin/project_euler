// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=10

#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <sstream>
#include <vector>

int is_prime(const int, const std::vector<int> &);

int main() {
  int last = 2000000;

  std::vector<int> primes;
  primes.push_back(2);

  uint64_t sum = 2;
  for (int test = 3; test < last; test += 2) {
    if (is_prime(test, primes)) {
      primes.push_back(test);
      sum += test;
    }
  }
  printf("%" PRIu64 "\n", sum);
//  primes.clear();
  std::vector<int>().swap(primes); // leaks memory with clear ??
  exit(0);
}

int is_prime(const int test, const std::vector<int> & primes) {
  int root = static_cast<int>(sqrt(test));

  for (std::vector<int>::const_iterator it = primes.begin();
       it < primes.end();
       it++) {
    if (*it > root)
      return 1;
    if (!(test % *it))
      return 0;
  }
  return 0;
}
