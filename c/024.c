#include <stdio.h>
#include <string.h>

#define OFFSET 48

int main()
{
/*
  9! is 362880 so after all the 10 digit numbers which 
  start with 0 or 1 we will have passed 725760 of the 
  combinations. The millionth combination will start
  with a 2, since we need to count 274240 more combinations
  after 2000000000.

  8! is 40320, so there are that many 10 digit combinations starting 20.
  The combination starting 22 is invalid (since the numerals must be
  distinct), so we could count 6 sets of combinations of 40320 up to
  2700000000 and then we would have seen 725760+241920 leaving 32320 to
  find.

  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.
*/

//  unsigned long long start = 2780000000; 
/* unsure why the compiler complains about initialising start to 2780000000; */
  unsigned long long start = 2000000000; 
  start                   += 700000000;
  start                   += 80000000;

  unsigned long long end   = 9876543210ull;

  unsigned long long count = 725760 + 241920 + 30240;
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
