#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint64_t next_term(uint64_t);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    exit(1);
  }
  int last = atoi(argv[1]);
  int max = 0;
  int maxi = 0;

  int i;
  for (i=(last>>1); i<last; ++i)
  {
    int counter = 0;
    uint64_t j = i;
    while (j != 1)
    {
      j = next_term(j);
      counter++;
    }
    counter++;

    printf("I is %d and COUNTER is %d\n", i, counter);
    if (counter > max)
    {
      max = counter;
      maxi = i;
    }
  }
  printf("IMAX is %d and MAX is %d\n", maxi, max);
  exit(0);
}

uint64_t next_term(uint64_t num)
{
  uint64_t retval =  (num % 2) ? num + num + num + 1 : num >> 1;
  return retval;
}
