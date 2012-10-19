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
  primes.push_back(3);

  int test = primes[primes.size() - 1] + 2;
  while (test < last) {
    if (is_prime(test, primes)) {
      primes.push_back(test);
    }
    test += 2;
  }
  uint64_t sum = 0;
  for (unsigned int i = 0; i < primes.size(); ++i) {
    sum += primes[i];
  }
  printf("%" PRIu64 "\n", sum);
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
