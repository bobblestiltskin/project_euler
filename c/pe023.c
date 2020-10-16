#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int sum_factors(int);

int main()
{
  const int MAX = 28123;
  int abundant[MAX];

  int ab_count = 0;
  int i;
  for (i = 1; i < MAX; ++i)
  {
    if (i < sum_factors(i))
      abundant[ab_count++] = i;  
  }
   
  int sum = 0;
  for (i = 1; i < MAX; ++i)
  {
    int addi = 0;
    int j;
    for (j = 0; j < ab_count; ++j)
    {
      if (i < abundant[j])
      {
        addi = 1;
        break;
      }
      int diff = i - abundant[j];
      int klast = 0;
      int k;
      for (k = 0; k < ab_count; ++k)
      {
        if (abundant[k] == diff)
        {
          klast = 1;
          break;
        }
      }
      if (klast)
        break;
    }
    if (addi)
      sum += i;
  }
  printf("%d\n", sum);
  return(0);
}

int sum_factors(int number)
{
  int sum = 1;
  int i;
  for (i = 2; i <= sqrt(number); ++i)
  {
    if (!(number % i))
    {
      int divisor = number / i;
      sum += i;
      if (i != divisor)
        sum += divisor;
    }
  }
  return sum;
}
