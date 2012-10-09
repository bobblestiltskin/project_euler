#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int factorial(const int, char *);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    return(1);
  }

  int maxa = atoi(argv[1]);
  int i = maxa;
//  int i;
//  for (i=0; i < maxa; i++)
//  {
    char *b = (char *) calloc(2, sizeof(char));
    strncpy(b, "1", 2);
    int status = 0;
printf("main BEFORE i is %d and B is %s\n", i, b);
    status = factorial(i, b);
printf("main AFTER i is %d and FACTORIAL is %s and STATUS is %d\n", i, b,  status);
//  }
  return(0);
}
