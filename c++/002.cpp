#include <iostream>
#include <sstream>

int fib(int);

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
  int i = 0;
  int fibi = fib(i);
  while (fibi < max)
  {
    if (!(fibi % 2))
      total += fibi;
    i++;
    fibi = fib(i);
  }
  std::cout << "MAX is " << max <<  " and TOTAL is " << total << std::endl;
  return(0);
}

int fib(int num)
{
  if (num < 2)
    return num;

  return (fib(num - 2) + fib(num - 1));
}
