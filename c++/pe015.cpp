// This is a solution for http://projecteuler.net/problem=15

#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#include <cstdio>
#include <vector>

int main() {
  const int max = 20;

/* need to compute 2n!/((n!)*(n!)) */

  std::vector<int> numerator;
  std::vector<int> denominator;
  for (int i = 0; i < max; i++) {
    denominator.push_back(i+1);
    numerator.push_back(i+max+1);
  }
/*
  walk through lists and cast away multiples to reduce size of numbers from
  factorials - this is incomplete factoring but sufficient for this problem
  we could factor both completely if we wanted...
*/
  for (std::vector<int>::iterator it = denominator.begin();
       it < denominator.end();
       it++) {
    for (std::vector<int>::iterator jt = numerator.begin();
         jt < numerator.end();
         jt++) {
      if ((*it != 1) && (!(*jt % *it))) {
        *jt = *jt / *it;
        *it = 1;
      }
    }
  }
  uint64_t num = 1;
  uint64_t denom = 1;
  for (int i = 0; i < max; i++) {
    num *= numerator.at(i);
    denom *= denominator.at(i);
  }

  printf("%" PRIu64 "\n", num/denom);
  return(0);
}
