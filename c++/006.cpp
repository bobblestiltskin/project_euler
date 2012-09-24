#include <stdio.h>

int main()
{
  int sumsq = 0;
  int i;
  for (i=0;i<100;++i)
  {
    sumsq += (i+1) * (i+1);
  }
  printf("SUMSQ is %d\n", sumsq);

  int sqsum = (101 * 50) * (101 * 50);
  printf("SQSUM is %d\n", sumsq);
  printf("DIFFERENCE is %d\n", sqsum - sumsq);
  
  return 0;
}
