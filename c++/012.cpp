// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=12

#include <cstdio>
#include <cmath>
#include <sstream>

int get_num_divisors(const int);

int main(int argc, char **argv) {
  if (argc != 2) {
    printf("Need 1 arg\n");
    return(1);
  }
  int last;
  std::stringstream ssout(argv[1]);
  ssout >> last;
  last /= 2;  // halve the value passed since we count up to the square root
              // which will give us half of the divisors

  int num = 0;
  int i = 0;
  int j = 1;
  while (num < last) {
    i = i + j;
    num = get_num_divisors(i);
    j++;
    printf("I is %d and J is %d and NUM is %d\n", i, j, num);
  }
  printf("I is %d and J is %d and NUM is %d\n", i, --j, num);
  return(0);
}

int get_num_divisors(int num) {
  int counter = 0;
  int running = 1;
/* we get half the divisors before the square root */
  while (running <= sqrt(num)) {
    if (!(num % running))
      counter++;
    running++;
  }
  return counter;
}
