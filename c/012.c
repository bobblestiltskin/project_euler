#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    exit(1);
  }
  int last = atoi(argv[1]) >> 1; /* halve the count */

  int num = 0;
  int i = 0;
  int j = 1;
  while (num < last)
  {
    i = i + j;
    num = get_num_divisors(i);
    j++;
    printf("I is %d and J is %d and NUM is %d\n", i, j, num);
  }
  printf("I is %d and J is %d and NUM is %d\n", i, --j, num);
  exit(0);
}

int get_num_divisors(int num)
{
  int counter = 0;
  int running = 1;
  while (running <= sqrt(num)) { /* we get half the divisors before the square root */
    if (!(num % running))
      counter++;
    running++;
  }
  return counter;
}
