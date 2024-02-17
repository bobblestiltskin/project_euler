// This is a solution for http://projecteuler.net/problem=14

#include <inttypes.h>
#include <cstdio>

uint64_t next_term(uint64_t);

int main() {
  int last = 1000000;

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

    if (counter > max) {
      max = counter;
      maxi = i;
    }
  }
  printf("%d\n", maxi);
  return(0);
}

uint64_t next_term(uint64_t num) {
  return (num % 2) ? num + num + num + 1 : num >> 1;
}
