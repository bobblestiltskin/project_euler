#include <stdio.h>
#include <stdint.h>
#include <string.h>

#define MAX3 999
#define MIN3 100
#define MAXDIGITS 6

uint8_t is_palindromic(char *);

int main()
{
  uint32_t maxp = 0;
  char digits[MAXDIGITS+1]; /* 6 digits max */

  uint16_t mini = MIN3;
  uint16_t minj = MIN3;
  uint16_t maxj = MAX3;
  uint16_t i;
  for (i = MAX3; i >= mini; i--)
  {
    uint16_t j;
    for (j = maxj; j >= minj; j--)
    {
      uint32_t product = i * j;
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wformat-truncation"
      snprintf(digits,MAXDIGITS+1,"%d",product);
#pragma GCC diagnostic pop
      if (is_palindromic(digits))
      {
        if (product > maxp)
        {
          maxp = product;
          mini = minj = product / 1000; /* optimize */
        }
      }
    }
    maxj = i;
  }
  printf("%d\n",maxp);
  
  return 0;
}

uint8_t is_palindromic(char *digits)
{
  uint8_t i;
  uint8_t len = strnlen(digits,MAXDIGITS);

  for (i=0;i<len;i++) /* only really need to test half of the string - if even and int(half)+1 if odd  - but more complexity */
    if (*(digits+i) != *(digits+len-(i+1)))
      return 0;

  return 1;
}
