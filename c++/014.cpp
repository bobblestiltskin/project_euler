// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=14

#include <cstdint>
#include <cstdio>
#include <sstream>

uint64_t next_term(uint64_t);

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Need 1 arg\n");
    return(1);
  }
  int last;
  std::stringstream ssout(argv[1]);
  ssout >> last;

  int max = 0;
  int maxi = 0;

  for (int i = (last>>1); i < last; ++i) {
    int counter = 0;
    uint64_t j = i;
    while (j != 1) {
      j = next_term(j);
      counter++;
    }
    counter++;

    printf("I is %d and COUNTER is %d\n", i, counter);
    if (counter > max) {
      max = counter;
      maxi = i;
    }
  }
  printf("IMAX is %d and MAX is %d\n", maxi, max);
  return(0);
}

uint64_t next_term(uint64_t num) {
  return (num % 2) ? num + num + num + 1 : num >> 1;
}
