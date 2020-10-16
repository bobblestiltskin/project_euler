#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint64_t next_term(uint64_t);

int main()
{
  int last = 1000000;
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

    if (counter > max)
    {
      max = counter;
      maxi = i;
    }
  }
  printf("%d\n", maxi);
  exit(0);
}

uint64_t next_term(uint64_t num)
{
  uint64_t retval =  (num % 2) ? num + num + num + 1 : num >> 1;
  return retval;
}
