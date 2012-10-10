// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=7

#include <cstdio>
#include <cmath>
#include <sstream>
#include <vector>

int is_prime(const int, const std::vector<int> &);

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Need 1 arg - the ordinal of the prime to find\n");
    return(1);
  }
  unsigned int primenum;
  std::stringstream ssout(argv[1]);
  ssout >> primenum;

  std::vector<int> primes;
  primes.push_back(2);
  primes.push_back(3);

  int test = primes[primes.size() - 1] + 2;
  while (primes.size() < primenum) {
    if (is_prime(test, primes))
      primes.push_back(test);
    test += 2;
  }
#ifdef DEBUG
  printf("PRIME %d is ", primenum);
#endif
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
