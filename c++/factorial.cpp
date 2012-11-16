// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

#include <cstdio>

#include "./numstring.h"

numstring factorial(int num) {
#ifdef DEBUG
printf("ENTERING factorial BEFORE is %d\n", num);
#endif

  numstring fac_string("1");
  for (int i = 0; i < num; ++i)
    fac_string *= (i+1);

#ifdef DEBUG
printf("LEAVING factorial AFTER num is %d and FACTORIAL is %s\n",
num, fac_string().c_str());
#endif

  return(fac_string);
}
