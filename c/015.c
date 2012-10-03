#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    return(1);
  }
  int max = atoi(argv[1]);

/* need to compute 2n!/((n!)*(n!)) */

  int numerator[max];
  int denominator[max];
  int i;
  for (i = 0; i < max; i++)
  {
    denominator[i] = i+1;
    numerator[i] = i+max+1;
  }
/*
  walk through lists and cast away multiples to reduce size of numbers from
  factorials
*/
  for (i=0; i < max; i++)
  {
    int j;
    for (j=0; j < max; j++)
    {
      if ((denominator[i] != 1) && (!(numerator[j] % denominator[i])))
      {
        numerator[j] = numerator[j] / denominator[i];
        denominator[i] = 1;
      }
    }
  }
  uint64_t num = 1;
  uint64_t denom = 1;
  for (i=0; i < max; i++)
  {
    num *= numerator[i];
    denom *= denominator[i];
  }

  printf("RESULT for %d is %lu (%lu / %lu remainder %lu)\n", max, num/denom, num, denom, num % denom);
  return(0);
}
