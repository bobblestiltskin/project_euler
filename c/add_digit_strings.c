#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define BASE 10

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
