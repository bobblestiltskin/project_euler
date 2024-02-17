// This is a solution for http://projecteuler.net/problem=25

#include <cstdio>
#include <sstream>
#include <string>
#include <vector>

#include "./numstring.h"

void fib(const int, std::vector< numstring > *);

int main() {
  const unsigned int maxlen = 1000;

  int i = 0;
  std::vector< numstring > fib_vector;
  fib(i, &fib_vector);
  while (fib_vector.at(i)().length() < maxlen)
    fib(++i, &fib_vector);

  printf("%d\n", i);
  return(0);
}

void fib(const int num, std::vector< numstring > *fib_vector) {
/* assumes that it is called in a loop with num starting at 0 */
  if (num < 2) {
    std::string digits;
    std::ostringstream tmp;
    tmp << num;
    digits = tmp.str();

    fib_vector->push_back(digits);
  } else {
    fib_vector->push_back(fib_vector->at(num - 2) + fib_vector->at(num - 1));
  }
}
