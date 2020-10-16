// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=1

#include <cstdio>

int main() {
  int max = 1000;

  int total = 0;
  for (int i = 0; i < max; ++i) {
    if (!(i % 3) || !(i % 5)) {
      total += i;
    }
  }
  printf("%d\n", total);
  return(0);
}
