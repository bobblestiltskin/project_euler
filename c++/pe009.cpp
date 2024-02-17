// This is a solution for http://projecteuler.net/problem=9

#include <cstdio>

int main() {
  int a, b, c;
  int stop = 1000;
  for (a = 1; a < stop; a++) {
    for (b = a + 1; b < stop; b++) {
      for (c = b + 1; c < stop; c++) {
        if ((a + b +c) == stop) {
          if ((a * a) + (b * b) == (c * c)) {
            printf("%d\n", a*b*c);
            return(0);
          }
        }
      }
    }
  }
  return(1);
}
