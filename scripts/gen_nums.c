#include <stdio.h>
#include <string.h>

#define MAXLEN 50

int main(int argc, char **argv) {
  if (argc < 2)
  {
    printf("Need at least 1 arg\n");
    return(1);
  }
  int last = atoi(argv[1]);

  char start[MAXLEN] = {0};
  char end[MAXLEN] = {0};
  if (argc == 4)
  {
    strncat(start, argv[2], strlen(argv[2]));
    strncpy(end, argv[3], strlen(argv[3]));
  }

  int i;
  for (i=0; i<last; ++i)
  {
    if (strlen(start))
      printf("%s", start);

    printf("%03d", i+1);
    if (strlen(end))
      printf("%s", end);

    printf("\n");
  }
  return(0);
}
