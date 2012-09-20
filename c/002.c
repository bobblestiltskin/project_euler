#include <stdio.h>
#include "stdlib.h"

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    exit(1);
  }
  int max = atoi(argv[1]);

  int total = 0;
  int i = 0;
  int fibi = fib(i);
  while (fibi < max)
  {
    if (!(fibi % 2))
      total += fibi;
    i++;
    fibi = fib(i);
  }
  printf("MAX is %d and TOTAL is %d\n", max, total);
  exit(0);
}

int fib(int num)
{
  if (num < 2)
    return num;

  return (fib(num - 2) + fib(num - 1));
}
