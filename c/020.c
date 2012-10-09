#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int factorial(const int, char **);
int mul_int_string(const int, const char *, char **);
int mul_digit_string(const int, const char *, char **);
int add_digit_strings(const char *, const char *, char **);

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    printf("Need 1 arg\n");
    return(1);
  }

  int maxa = atoi(argv[1]);
  char *b = (char *) calloc(2, sizeof(char));
  strncpy(b, "1", 1);
  int status = 0;
  status = factorial(maxa, &b);
  printf("FACTORIAL is %s and STATUS is %d\n", b,  status);
  int sum = 0;
  int i;
  for(i=0; i<strlen(b); ++i)
    sum += *(b+i) - '0';
  printf("SUM is %d\n", sum);

  free(b);
  return(0);
}

int factorial(int num, char **factorial_ptr)
{
#ifdef DEBUG
printf("ENTERING factorial BEFORE is %d and FACTORIAL is %s\n", num, *factorial_ptr);
#endif

  int status = 0;
  int i;
  for (i = 0; i < num;++i)
    status = mul_int_string(i+1, *factorial_ptr, factorial_ptr);

#ifdef DEBUG
printf("LEAVING factorial AFTER num is %d and FACTORIAL is %s\n", num, *factorial_ptr);
#endif

  return(status);
}

int mul_int_string(int alpha, const char *in_string, char **out_string_ptr)
{
#ifdef DEBUG
printf("ENTERING mul_int_string with alpha of %d and in_string of %s and outstring of %s\n", alpha, in_string, *out_string_ptr);
#endif

  /* multiplies the input string in_string by the integer alpha */

  int in_length = strlen(in_string);
  char *in_copy = calloc(in_length + 1, sizeof(char));
  strncpy(in_copy, in_string, in_length);
  strncpy(*out_string_ptr, "0", 2);

  do {
    int modulus = alpha % BASE;
    int in_copy_len = strlen(in_copy);
    if (modulus)
    {
      if (modulus == 1)
      {
        char *out_current = (char *) calloc(strlen(*out_string_ptr) + 1, sizeof(char));
        strncpy(out_current, *out_string_ptr, strlen(*out_string_ptr) + 1);
        add_digit_strings(out_current, in_copy, out_string_ptr);
        free(out_current);
      }
      else
      {
        char *row = (char *) calloc(in_copy_len + 2, sizeof(char));
        int mds_ret = mul_digit_string(modulus, in_copy, &row);
        assert (mds_ret == 0);
        char *out_current = (char *) calloc(strlen(*out_string_ptr) + 1, sizeof(char));
        strncpy(out_current, *out_string_ptr, strlen(*out_string_ptr) + 1);
        add_digit_strings(out_current, row, out_string_ptr);
        free(out_current);
        free(row);
      }
    }
    in_copy = realloc(in_copy, strlen(in_copy) + 2);
    strncat(in_copy, "0", 1);
  } while ((alpha = alpha / BASE));
  free(in_copy);

#ifdef DEBUG
printf("LEAVING mul_int_string with alpha of %d and in_string of %s and outstring of %s\n", alpha, in_string, *out_string_ptr);
#endif
  
  return 0;
}

int mul_digit_string(const int digit, const char *in_string, char **out_string_ptr)
{
  /* multiplies the in_string by a single digit */

#ifdef DEBUG
printf("entering mul_digit_string digit is %d input is %s output is %s\n", digit, in_string, *out_string_ptr);
#endif

  assert(digit >= 0);
  assert(digit <= 9);

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
  {
    int out_len = strlen(*out_string_ptr);
    char *tmp = calloc(out_len + 1, sizeof(char));
    strncpy(tmp, *out_string_ptr, out_len);
    *out_string_ptr = realloc(*out_string_ptr, out_len + 2);
    *(*out_string_ptr) = carry + '0';
    *(*out_string_ptr+1) = 0;
    strncat(*out_string_ptr, tmp, strlen(tmp));
    free(tmp);
  }

#ifdef DEBUG
printf("leaving mul_digit_string output is %s\n", *out_string_ptr);
#endif

  return 0;
}

int add_digit_strings(const char *in_1_string, const char *in_2_string, char **out_string_ptr)
{
  /* generate out_string by adding in_2_string to in_1_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s and OUT STRING is %s\n", in_1_string, in_2_string, *out_string_ptr);
printf("PTS add_digit_strings IN 1 STRING is %p IN 2 STRING is %p OUT STRING is %p\n", in_1_string, in_2_string, *out_string_ptr);
printf("LEN add_digit_strings IN 1 STRING is %d IN 2 STRING is %d OUT STRING is %d\n", (int) strlen(in_1_string), (int) strlen(in_2_string), (int) strlen(*out_string_ptr));
#endif

  char *min_ptr = NULL;
  char *max_ptr = NULL;
  int min_len, max_len;

  /* if the second string is shorter than the first, swap them */
  if (strlen(in_2_string) < strlen(in_1_string)) 
  {
    max_len = strlen(in_1_string);
    max_ptr = (char *) in_1_string;
    min_len = strlen(in_2_string);
    min_ptr = (char *) in_2_string;
  }
  else
  {
    max_len = strlen(in_2_string);
    max_ptr = (char *) in_2_string;
    min_len = strlen(in_1_string);
    min_ptr = (char *) in_1_string;
  }

  if (strncmp(min_ptr, "0", min_len))
  {
    int out_len = strlen(*out_string_ptr);
    if (max_len > out_len)
    {
      *out_string_ptr = realloc(*out_string_ptr, max_len + 1);
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
      int in1 = *(min_ptr+j-1) - '0';
      assert(in1 >= 0);
      assert(in1 <= 9);
      int in2 = *(max_ptr+index) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in1 + in2 + carry;
      *(*out_string_ptr+index) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* then handle any character positions only in longer string */
    for (j = max_len - min_len; j > 0; --j)
    {
      int in2 = *(max_ptr+j-1) - '0';
      assert(in2 >= 0);
      assert(in2 <= 9);
      int tmp = in2 + carry;
      *(*out_string_ptr+j-1) = tmp % BASE + '0';
      carry = tmp / BASE;
    }
    /* need to move the string characters */
    if (carry)
    {
      out_len = strlen(*out_string_ptr);
      char *tmp = calloc(out_len + 1, sizeof(char));
      strncpy(tmp, *out_string_ptr, out_len);
      *out_string_ptr = realloc(*out_string_ptr, out_len + 2);
      *(*out_string_ptr) = carry + '0';
      *(*out_string_ptr+1) = 0;
      strncat(*out_string_ptr, tmp, strlen(tmp));
      free(tmp);
    }
  }
  else
  {
    *out_string_ptr = realloc(*out_string_ptr, max_len + 1);
    memcpy(*out_string_ptr, max_ptr, max_len + 1);
  }

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s\n", in_1_string);
printf("LEAVING add_digit_strings IN 2 STRING is %s\n", in_2_string);
printf("LEAVING add_digit_strings OUT STRING is %s\n", *out_string_ptr);
#endif

  return 0;
}
