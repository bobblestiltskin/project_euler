// This is a solution for http://projecteuler.net/problem=6

#include <cstdio>

int main() {
  int sumsq = 0;
  for (int i = 0; i < 100; ++i) {
    sumsq += (i+1) * (i+1);
  }

  int sqsum = (101 * 50) * (101 * 50);
  printf("%d\n", sqsum - sumsq);

  return 0;
}
