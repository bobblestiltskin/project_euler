// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=2

#include <cstdio>
#include <sstream>
#include <vector>

int fib(const int, std::vector<int> *);

int main() {
  const int max = 4000000;

  int total = 0;
  int i = 0;
  std::vector<int> fib_vector;
  int fibi = fib(i, &fib_vector);
  while (fibi < max) {
    if (!(fibi % 2))
      total += fibi;
    i++;
    fibi = fib(i, &fib_vector);
  }
  printf("%d\n", total);
  return(0);
}

int fib(const int num, std::vector<int> *fib_vector) {
/* assumes that it is called in a loop with num starting at 0 */
  if (num < 2)
    fib_vector->push_back(num);
  else
    fib_vector->push_back(fib_vector->at(num - 2) + fib_vector->at(num - 1));

  return fib_vector->at(num);
}
