// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>
#include <string>

std::string mul_int_string(const int, const std::string);

std::string factorial(int num) {
#ifdef DEBUG
printf("ENTERING factorial BEFORE is %d\n", num);
#endif

  std::string fac_string = "1";
  for (int i = 0; i < num; ++i)
    fac_string = mul_int_string(i+1, fac_string);

#ifdef DEBUG
printf("LEAVING factorial AFTER num is %d and FACTORIAL is %s\n",
num, fac_string.c_str());
#endif

  return(fac_string);
}
