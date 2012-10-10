// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=6

#include <cstdio>

int main() {
  int sumsq = 0;
  for (int i = 0; i < 100; ++i) {
    sumsq += (i+1) * (i+1);
  }
#ifdef DEBUG
  printf("SUMSQ is %d\n", sumsq);
#endif

  int sqsum = (101 * 50) * (101 * 50);
#ifdef DEBUG
  printf("SQSUM is %d\n", sumsq);
  printf("DIFFERENCE is ");
#endif
  printf("%d\n", sqsum - sumsq);

  return 0;
}
