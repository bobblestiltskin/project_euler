#include <stdio.h>
#include <string.h>

#define OFFSET 48

int main()
{
  unsigned long long start = 2000000000;
  unsigned long long end =   9876543210;

  unsigned long long count = 362880 << 1;
  unsigned long long i;
  for (i = start; i <= end; ++i)
  {
    char string[11];
    snprintf(string, 11, "%010llu", i);

    if (strchr(string, OFFSET + 0) == NULL)
      continue;
    if (strchr(string, OFFSET + 1) == NULL)
      continue;
    if (strchr(string, OFFSET + 2) == NULL)
      continue;
    if (strchr(string, OFFSET + 3) == NULL)
      continue;
    if (strchr(string, OFFSET + 4) == NULL)
      continue;
    if (strchr(string, OFFSET + 5) == NULL)
      continue;
    if (strchr(string, OFFSET + 6) == NULL)
      continue;
    if (strchr(string, OFFSET + 7) == NULL)
      continue;
    if (strchr(string, OFFSET + 8) == NULL)
      continue;
    if (strchr(string, OFFSET + 9) == NULL)
      continue;
    
    count++;
    if (count == 1000000)
      break;
  }
  printf("%llu\n", i);
  return(0);
}
