#include <stdio.h>
#include <stdlib.h>

int fib(int, int *);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    exit(1);
  }
  int max = atoi(argv[1]);

  int total = 0;
  int i = 0;
  int *vector = (int *) malloc(i);
  int fibi = fib(i, vector);
  while (fibi < max)
  {
    if (!(fibi % 2))
      total += fibi;
    i++;
    fibi = fib(i, vector);
  }
  printf("MAX is %d and TOTAL is %d\n", max, total);
  free(vector);
  exit(0);
}

int fib(int num, int *vector)
{
/* assumes that it is called in a loop with num starting at 0 */
  vector = realloc(vector, (num + 1) * sizeof(int));

  if (num < 2)
    *(vector+num) = num;
  else
    *(vector+num) = *(vector+num-2) + *(vector+num-1);

  return *(vector+num);
}
