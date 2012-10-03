// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=4

#include <cstdint>
#include <cstdio>
#include <string>
#include <sstream>

bool is_palindromic(const std::string &);

int main() {
  int maxp = 0;
  std::string digits;

  const int MAX3 = 999;
  const int MIN3 = 100;

  int mini = MIN3;
  int minj = MIN3;
  int i;
  for (i = MAX3; i >= mini; i--) {
    int j;
    for (j = MAX3; j >= minj; j--) {
      int product = i * j;
      std::ostringstream tmp;
      tmp << product;
      digits = tmp.str();
      if (is_palindromic(digits)) {
        printf("PALINDROME %d of %d * %d\n", product, i, j);
        if (product > maxp) {
          maxp = product;
          mini = minj = product / 1000; /* optimize */
        }
      }
    }
  }
  printf("MAXP is %d\n", maxp);

  return 0;
}

bool is_palindromic(const std::string &digits) {
  int i;
  int len = digits.length();

// only really need to test half of the string - if even
// and int(half)+1 if odd  - but more complexity

  for (i = 0; i < len; ++i)
    if (digits[i] != digits[len-(i+1)])
      return 0;

  return 1;
}
