// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=20

#include <cstdio>
#include <string>
#include <sstream>
#include <cassert>

#include "./numstring.h"

numstring factorial(const int);

int main() {
  const int maxa = 100;

  numstring fac_string = factorial(maxa);
  int sum = 0;
  for (unsigned int i = 0; i < fac_string().length(); ++i)
    sum += fac_string().at(i) - '0';
  printf("%d\n", sum);

  return(0);
}
