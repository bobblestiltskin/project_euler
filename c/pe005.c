#include <stdio.h>

#define MAX 20

unsigned int isprime(unsigned int);

int main()
{
  unsigned int i = 2;
  unsigned int try_product = 1;
  unsigned int total = 1;
  while (i <= MAX) {
    if (isprime(i)) {
      if (try_product) {
        if ((i * i) > MAX) {
          try_product = 0;
        } else {
          unsigned int tmp = i;
          unsigned int last = tmp;
          while (tmp <= MAX) {
            last = tmp;
            tmp *= i;
          }
          total *= last;
        }
      }
      if (!(try_product))
        total *= i;
    }
    i++;
  }
  printf("%d\n",total);
  return 0;
}

unsigned int isprime(unsigned int num) {
  if (num % 2) {
    if (num < 8) {
      return !(num == 1);
    } else {
      unsigned int divisor = 3;
      while ((divisor * divisor) <= num) {
        if (!(num % divisor))
          return 0;
        divisor += 2;
      }
      return 1;
    }
  } else {
    return num == 2;
  }
}
