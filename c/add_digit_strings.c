#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

int add_strings_short_to_long(const char *, const char *, char **);
int handle_carry(int, char **);

int add_digit_strings(const char *in_1_string, const char *in_2_string, char **out_string_ptr)
{
  /* generate out_string by adding in_1_string to in_2_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s and OUT STRING is %s\n", in_1_string, in_2_string, *out_string_ptr);
printf("PTS add_digit_strings IN 1 STRING is %p IN 2 STRING is %p OUT STRING is %p\n", in_1_string, in_2_string, *out_string_ptr);
printf("LEN add_digit_strings IN 1 STRING is %d IN 2 STRING is %d OUT STRING is %d\n", (int) strlen(in_1_string), (int) strlen(in_2_string), (int) strlen(*out_string_ptr));
#endif

  int status;
  /* if the second string is shorter than the first, swap them */
  if (strlen(in_2_string) < strlen(in_1_string))
    status = add_strings_short_to_long(in_2_string, in_1_string, out_string_ptr);
  else
    status = add_strings_short_to_long(in_1_string, in_2_string, out_string_ptr);

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s\n", in_1_string);
printf("LEAVING add_digit_strings IN 2 STRING is %s\n", in_2_string);
printf("LEAVING add_digit_strings OUT STRING is %s\n", *out_string_ptr);
#endif

  return status;
}

int add_strings_short_to_long(const char *short_string, const char *long_string, char **out_string_ptr)
{
  /* generate out_string by adding in_1_string to in_2_string */

#ifdef DEBUG
printf("ENTERING add_digit_strings IN 1 STRING is %s IN 2 STRING is %s and OUT STRING is %s\n", in_1_string, in_2_string, *out_string_ptr);
printf("PTS add_digit_strings IN 1 STRING is %p IN 2 STRING is %p OUT STRING is %p\n", in_1_string, in_2_string, *out_string_ptr);
printf("LEN add_digit_strings IN 1 STRING is %d IN 2 STRING is %d OUT STRING is %d\n", (int) strlen(in_1_string), (int) strlen(in_2_string), (int) strlen(*out_string_ptr));
#endif

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

#ifdef DEBUG
printf("LEAVING add_digit_strings IN 1 STRING is %s\n", in_1_string);
printf("LEAVING add_digit_strings IN 2 STRING is %s\n", in_2_string);
printf("LEAVING add_digit_strings OUT STRING is %s\n", *out_string_ptr);
#endif

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

