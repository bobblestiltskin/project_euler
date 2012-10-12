#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int get_num_divisors(int);

int main()
{
  int last = 500 >> 1; /* halve the count */

  int num = 0;
  int i = 0;
  int j = 1;
  while (num < last)
  {
    i = i + j;
    num = get_num_divisors(i);
    j++;
  }
  printf("%d\n", i);
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
