// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <sstream>

#include "./numstring.h"

numstring factorial(const int);

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Need 1 arg\n");
    return(1);
  }
  int maxa;
  std::stringstream ssout(argv[1]);
  ssout >> maxa;

  numstring fac_string = factorial(maxa);
  printf("main AFTER maxa is %d and FACTORIAL is %s\n",
         maxa, fac_string.get().c_str());
  int sum = 0;
  for (unsigned int i = 0; i < fac_string.get().length(); ++i)
    sum += fac_string.get().at(i) - '0';
  printf("SUM is %d\n", sum);

  return(0);
}
