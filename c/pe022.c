#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <errno.h>

static int cmpstringp(const void *, const void *);

int main()
{
  char *filename = "../names.txt";

  FILE *fh = fopen(filename, "rb");
  if (fh == NULL) {
    printf("ERROR: Cannot open %s\n", filename);
    return 1;
  }
  
  struct stat sbuf;
  if (fstat(fileno(fh), &sbuf) != 0)
  {
    printf("ERROR: cannot fstat file\n");
    return 2;
  }

  char *string = (char *) calloc(sbuf.st_size + 1, sizeof(char));
  if (fread(string, sizeof(char), sbuf.st_size, fh) != sbuf.st_size)
  {
    printf("ERROR: short read\n");
    return 3;
  }
   
  /* count the distinct names */
  int i;
  int commas = 0;
  for (i = 0; i < strlen(string); ++i)
    if (*(string+i) == ',')
      commas++;

  char *names[commas+1];

  *(string+strlen(string)-1) = 0; // trim trailing "

  char *token = strtok(string + 1, "\",\""); // start after first "
  int index = 0;
  names[index] = (char *) calloc(strlen(token) + 2, sizeof(char));
  strncpy(names[index], token, strlen(token));
  *(names[index]+strlen(token)+1) = 0; // store first name to array

  while (1)
  {
    token = strtok(NULL, "\",\"");
    if (token == NULL)
      break;
    names[++index] = (char *) calloc(strlen(token) + 2, sizeof(char));
    strncpy(names[index], token, strlen(token));
    *(names[index]+strlen(token)+1) = 0; // store the names
  }
  
  qsort(names, index + 1, sizeof(char *), cmpstringp); // sort the names

  int result = 0;
  for (i=0; i<=index; ++i)
  {
    int letters = 0;
    int j;
    for (j=0; j<strlen(names[i]); ++j)
      letters += *(names[i]+j) - 64;
    result += letters * (i+1);
  }

  for (i=0; i<=index; ++i)
    free(names[i]);

  free(string);

  if (fclose(fh))
  {
    printf("ERROR: Can not close File, %d\n", errno);
    return(4);
  }

  printf("%d\n", result);
  return(0);
}

/* following borrowed from "man qsort" */

static int
cmpstringp(const void *p1, const void *p2)
{
  /* The actual arguments to this function are "pointers to
  pointers to char", but strcmp(3) arguments are "pointers
  to char", hence the following cast plus dereference */

  return strcmp(* (char * const *) p1, * (char * const *) p2);
}
