#include <stdio.h>
#include <stdlib.h>

int main()
{
  int max = 1000;

  int total = 0;
  int i;
  for (i=0; i<max; i++)
  {
    if (!(i % 3) || !(i % 5))
    {
      total += i;
    }
  }
  printf("%d\n", total);
  exit(0);
}
