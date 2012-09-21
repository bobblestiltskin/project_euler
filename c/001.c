#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    exit(1);
  }
  int max = atoi(argv[1]);

  int total = 0;
  int i;
  for (i=0; i<max; i++)
  {
    if (!(i % 3) || !(i % 5))
    {
      total += i;
    }
  }
  printf("MAX is %d and TOTAL is %d\n", max, total);
  exit(0);
}
