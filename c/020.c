#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int factorial(const int, char **);
int mul_int_string(const int, const char *, char **);
int mul_digit_string(const int, const char *, char **);
int add_digit_strings(const char *, const char *, char **);
int add_strings_short_to_long(const char *, const char *, char **);
int handle_carry(int, char **);

int main()
{
  int maxa = 100;
  char *b = (char *) calloc(2, sizeof(char));
  strncpy(b, "1", 1);
  int status = 0;
  status = factorial(maxa, &b);
  int sum = 0;
  int i;
  for(i=0; i<strlen(b); ++i)
    sum += *(b+i) - '0';
  printf("%d\n", sum);

  free(b);
  return(0);
}

int factorial(int num, char **factorial_ptr)
{
  int i;
  for (i = 0; i < num;++i)
  {
    int mis_ret = mul_int_string(i+1, *factorial_ptr, factorial_ptr);
    assert(mis_ret == 0);
  }

  return(0);
}

int mul_int_string(int alpha, const char *in_string, char **out_string_ptr)
{
  /* multiplies the input string in_string by the integer alpha */

  int in_length = strlen(in_string);
  char *in_copy = (char *) calloc(in_length + 1, sizeof(char));
  strncpy(in_copy, in_string, in_length);
  strncpy(*out_string_ptr, "0", 1);
  *(*out_string_ptr+1) = 0; // terminate output string

  /* we are doing long multiplication here */
  do {
    int modulus = alpha % BASE;
    int in_copy_len = strlen(in_copy);
    if (modulus)
    {
      if (modulus == 1)
      { // no need to multiply - add out current input to the output
        char *out_current = (char *) calloc(strlen(*out_string_ptr) + 1, sizeof(char));
        strncpy(out_current, *out_string_ptr, strlen(*out_string_ptr) + 1);
        int ads_ret = add_digit_strings(out_current, in_copy, out_string_ptr);
        assert(ads_ret == 0);
        free(out_current);
      }
      else
      { // scale the current input by the modulus and add
        char *row = (char *) calloc(in_copy_len + 2, sizeof(char));
        int mds_ret = mul_digit_string(modulus, in_copy, &row);
        assert(mds_ret == 0);
        char *out_current = (char *) calloc(strlen(*out_string_ptr) + 1, sizeof(char));
        strncpy(out_current, *out_string_ptr, strlen(*out_string_ptr) + 1);
        int ads_ret = add_digit_strings(out_current, row, out_string_ptr);
        assert(ads_ret == 0);
        free(out_current);
        free(row);
      }
    }
    in_copy = (char *) realloc(in_copy, strlen(in_copy) + 2);
    strncat(in_copy, "0", 1); // add a '0' to the end of the input number
  } while ((alpha = alpha / BASE)); // and iterate through the integer
  free(in_copy);

  return 0;
}

int mul_digit_string(const int digit, const char *in_string, char **out_string_ptr)
{
  /* multiplies the in_string by a single digit */

  assert(digit >= 0);
  assert(digit <= 9);

  if (digit == 0)
    strncpy(*out_string_ptr, "0", 1);
  else if (digit == 1)
    strncpy(*out_string_ptr, in_string, strlen(in_string));
  else
  {
    int carry = 0;
    int i;
    for (i = strlen(in_string); i > 0; --i)
    {
      int in = *(in_string + i - 1) - '0';
    
      assert(in >= 0);
      assert(in <= 9);
  
      int product = in * digit + carry;
      int new = product % BASE;
      *(*out_string_ptr + i - 1) = new + '0';
      carry = product / BASE;
    }
  
    if (carry)
      handle_carry(carry, out_string_ptr);
  }

  return 0;
}

int add_digit_strings(const char *in_1_string, const char *in_2_string, char **out_string_ptr)
{
  /* generate out_string by adding in_1_string to in_2_string */

  int status;
  /* if the second string is shorter than the first, swap them */
  if (strlen(in_2_string) < strlen(in_1_string))
    status = add_strings_short_to_long(in_2_string, in_1_string, out_string_ptr);
  else
    status = add_strings_short_to_long(in_1_string, in_2_string, out_string_ptr);

  return status;
}

int add_strings_short_to_long(const char *short_string, const char *long_string, char **out_string_ptr)
{
  /* generate out_string by adding in_1_string to in_2_string */

  int min_len = strlen(short_string);
  int max_len = strlen(long_string);

  if (strncmp(short_string, "0", min_len))
  {
    int out_len = strlen(*out_string_ptr);
    if (max_len > out_len)
    {
      *out_string_ptr = (char *) realloc(*out_string_ptr, max_len + 1);
      out_len = strlen(*out_string_ptr);
      int j;
      for (j=out_len; j<max_len; j++)
        *(*out_string_ptr+j+1) = 0;
    }

    int carry = 0;
    int j;
    /* walk backwards along the shorter string and add elements */
    for (j = min_len; j > 0; --j)
    {
      int index = max_len - min_len + j - 1;
      int in1 = *(short_string+j-1) - '0';
      assert(in1 >= 0);
      assert(in1 <= 9);
      int in2 = *(long_string+index) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in1 + in2 + carry;
      *(*out_string_ptr+index) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* then handle any character positions only in longer string */
    for (j = max_len - min_len; j > 0; --j)
    {
      int in2 = *(long_string+j-1) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in2 + carry;
      *(*out_string_ptr+j-1) = tmp % BASE + '0';
      carry = tmp / BASE;
    }

    if (carry)
      handle_carry(carry, out_string_ptr);
  }
  else
  {
    *out_string_ptr = (char *) realloc(*out_string_ptr, max_len + 1);
    memcpy(*out_string_ptr, long_string, max_len + 1);
  }

  return 0;
}

int handle_carry(int carry, char **out_string_ptr)
{
  int out_len = strlen(*out_string_ptr);
  char *tmp = (char *) calloc(out_len + 1, sizeof(char));
  strncpy(tmp, *out_string_ptr, out_len);
  *out_string_ptr = (char *) realloc(*out_string_ptr, out_len + 2);
  *(*out_string_ptr) = carry + '0';
  *(*out_string_ptr+1) = 0;
  strncat(*out_string_ptr, tmp, strlen(tmp));
  free(tmp);
  return 0;
}
