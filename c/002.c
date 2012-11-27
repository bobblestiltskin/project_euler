#include <stdio.h>

int main()
{
  int max = 4000000;

  int total = 0;
  int previous = 1;
  int current = 1;
  while (current < max)
  {
    int next = current + previous;
    if (!(current % 2))
      total += current;
    previous = current;
    current = next;
  }
  printf("%d\n", total);
  return(0);
}
