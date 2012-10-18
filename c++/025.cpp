// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=25

#include <cstdio>
#include <sstream>
#include <string>
#include <vector>

void fib(const int, std::vector< std::string > *);
std::string add_digit_strings(const std::string, const std::string);

int main() {
  const unsigned int maxlen = 1000;

  int i = 0;
  std::vector< std:: string > fib_vector;
  fib(i, &fib_vector);
  while (fib_vector.at(i).length() < maxlen)
    fib(++i, &fib_vector);

  printf("%d\n", i);
  return(0);
}

void fib(const int num, std::vector< std::string > *fib_vector) {
/* assumes that it is called in a loop with num starting at 0 */
  if (num < 2) {
    std::string digits;
    std::ostringstream tmp;
    tmp << num;
    digits = tmp.str();

    fib_vector->push_back(digits);
  } else {
    fib_vector->push_back(add_digit_strings(fib_vector->at(num - 2), fib_vector->at(num - 1)));
  }
}
