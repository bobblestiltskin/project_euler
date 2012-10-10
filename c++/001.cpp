// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=1

#include <cstdio>
#include <sstream>

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Need 1 arg\n");
    return(1);
  }
  int max;
  std::stringstream ssout(argv[1]);
  ssout >> max;

  int total = 0;
  for (int i = 0; i < max; ++i) {
    if (!(i % 3) || !(i % 5)) {
      total += i;
    }
  }
  printf("MAX is %d and TOTAL is %d\n", max, total);
  return(0);
}
