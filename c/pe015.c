#include <stdio.h>
#include <stdlib.h>

int main()
{
  const int max = 20;

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
  unsigned long long num = 1;
  unsigned long long denom = 1;
  for (i=0; i < max; i++)
  {
    num *= numerator[i];
    denom *= denominator[i];
  }

  printf("%llu\n", num/denom);
  return(0);
}
