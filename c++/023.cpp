// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=23

#include <cstdio>
#include <cmath>
#include <vector>

int sum_factors(int number);

int main() {
  const int MAX = 28123;
  std::vector<int> abundant;

  for (int i = 1; i < MAX; ++i)
    if (i < sum_factors(i))
      abundant.push_back(i);

  int sum = 0;
  for (int i = 1; i < MAX; ++i) {
    int addi = 0;
    for (std::vector<int>::iterator jt = abundant.begin();
         jt < abundant.end();
         jt++) {
      if (i < *jt) {
        addi = 1;
        break;
      }
      int diff = i - *jt;
      int klast = 0;
      for (std::vector<int>::iterator kt = abundant.begin();
           kt < abundant.end();
           kt++) {
        if (*kt == diff) {
          klast = 1;
          break;
        }
      }
      if (klast)
        break;
    }
    if (addi)
      sum += i;
  }
  printf("%d\n", sum);
  return(0);
}

int sum_factors(int number) {
  int sum = 1;
  int i;
  for (i = 2; i <= sqrt(number); ++i) {
    if (!(number % i)) {
      int divisor = number / i;
      sum += i;
      if (i != divisor)
        sum += divisor;
    }
  }
  return sum;
}
