#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int factorial(const int, char **);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    return(1);
  }

  int maxa = atoi(argv[1]);
  char *b = (char *) calloc(2, sizeof(char));
  strncpy(b, "1", 2);
  int status = 0;
  status = factorial(maxa, &b);
  printf("main AFTER maxa is %d and FACTORIAL is %s and STATUS is %d\n", maxa, b,  status);
  int sum = 0;
  int i;
  for(i=0; i<strlen(b); ++i)
    sum += *(b+i) - '0';
  printf("SUM is %d\n", sum);

  free(b);
  return(0);
}
