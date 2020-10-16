#include <stdio.h>

int main()
{
  int sumsq = 0;
  int i;
  for (i=0;i<100;++i)
  {
    sumsq += (i+1) * (i+1);
  }

  int sqsum = (101 * 50) * (101 * 50);
  printf("%d\n", sqsum - sumsq);
  
  return 0;
}
