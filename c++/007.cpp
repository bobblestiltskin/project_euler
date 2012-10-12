// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=7

#include <cstdio>
#include <cmath>
#include <vector>

int is_prime(const int, const std::vector<int> &);

int main() {
  const unsigned int primenum = 10001;

  std::vector<int> primes;
  primes.push_back(2);
  primes.push_back(3);

  int test = primes[primes.size() - 1] + 2;
  while (primes.size() < primenum) {
    if (is_prime(test, primes))
      primes.push_back(test);
    test += 2;
  }
  printf("%d\n", primes[primes.size() - 1]);
  return(0);
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
