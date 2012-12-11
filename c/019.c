#include <stdio.h>

int main()
{
  int cycle[48]  = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                    31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

  int count = 0;
  int dow = 2; /* start on tuesday 1901.1.1 */
  int i;
  for (i = 0; i < 25; ++i) // 2000 is a leap year too!
  {
    int j;
    for (j = 0; j < 48; ++j) // 48 months in 4 year cycle
    {
      if (!dow)
        count++;
      dow = (dow + cycle[j]) % 7;
    }
  }
  printf("%d\n", count);
  return 0;
}
