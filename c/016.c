#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ASCII 48

void double_string(char *);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    exit(1);
  }
  int max = atoi(argv[1]);

// initialise a string to 2 - we store ASCII because it is easier to print
// we could store the raw numbers for a little better performance
  char *in_string = (char *) malloc(2);
  *in_string = 1 + ASCII; 
  *(in_string+1) = 0;

  int i;
  for (i=0; i < max; ++i)
  {
    double_string(in_string);
  }
  printf("STRING is %s\n", in_string);
  int sum = 0;
  for (i=0; i < strlen(in_string); ++i)
  {
    sum += *(in_string+i) - ASCII;
  }
  printf("SUM of digits in string is %d\n", sum);

  return(0);
}

void double_string(char *in)
{
/*
  given a string containing an integer this function will double the value
  the string will be extended if necessary to hold the number
*/

  int first = *in - ASCII; /* use ASCII in string */
  int ra = 0;
  if ((first == 5) || (first == 6) || (first == 7) || (first == 8) || (first == 9))
  {
/*  extend string by a character */
    in = realloc(in, strlen(in) + 2);
    ra = 1;
    *(in+strlen(in)) = *(in+strlen(in)+1) = 0; // initialise to null
  }

/* walk backwards through the string doubling as we go */
  int carry = 0;
  int j;
  for (j = strlen(in); j > 0; --j)
  {
    int i = j - 1;
    switch(*(in+i)-ASCII)
    {
      case 0:
        *(in+i+ra) = 0 + ASCII + carry;
        carry = 0;
        break;
      case 1:
        *(in+i+ra) = 2 + ASCII + carry;
        carry = 0;
        break;
      case 2:
        *(in+i+ra) = 4 + ASCII + carry;
	carry = 0;
        break;
      case 3:
        *(in+i+ra) = 6 + ASCII + carry;
        carry = 0;
        break;
      case 4:
        *(in+i+ra) = 8 + ASCII + carry;
        carry = 0;
        break;
      case 5:
        *(in+i+ra) = 0 + ASCII + carry;
        carry = 1;
        break;
      case 6:
        *(in+i+ra) = 2 + ASCII + carry;
        carry = 1;
        break;
      case 7:
        *(in+i+ra) = 4 + ASCII + carry;
        carry = 1;
        break;
      case 8:
        *(in+i+ra) = 6 + ASCII + carry;
        carry = 1;
        break;
      case 9:
        *(in+i+ra) = 8 + ASCII + carry;
        carry = 1;
        break;
    }
  }
  if (carry)
  {
    *in = 0 + ASCII + carry;
    carry = 0;
  }
}
