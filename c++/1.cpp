#include <iostream>
#include <sstream>

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    std::cout << "Need 1 arg" << std::endl;
    return(1);
  }
  int max;
  std::stringstream ssout(argv[1]);
  ssout >> max;

  int total = 0;
  int i;
  for (i=0; i<max; i++)
  {
    if (!(i % 3) || !(i % 5))
    {
      total += i;
    }
  }
  std::cout << "MAX is " << max <<  " and TOTAL is " << total << std::endl;
  return(0);
}
