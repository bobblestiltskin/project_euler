// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=5

#include <cstdio>
#include <vector>

int main() {
  const std::vector<int> primes({2, 3, 5, 7, 11, 13, 17, 19});  // c++11
/*
maximum power of 2 in 1..20 is 16 or 2^4
maximum power of 3 in 1..20 is 9 or 3^2
maximum power of other primes < 20 is n^1
*/
  int result = 2 * 2 * 2 * 3;
/* we initialise the result to the powers of 2 and 3 above 1 */
  for (std::vector<int>::const_iterator it = primes.begin();
       it < primes.end();
       it++)
    result *= *it;

#ifdef DEBUG
  printf("RESULT is ");
#endif
  printf("%d\n", result);

  return 0;
}
