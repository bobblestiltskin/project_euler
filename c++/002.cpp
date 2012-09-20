#include <iostream>
#include <sstream>
#include <vector>

int fib(int, std::vector<int> &);

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
  std::vector<int> fib_vector; 
  int fibi = fib(i, fib_vector);
  while (fibi < max)
  {
    if (!(fibi % 2))
      total += fibi;
    i++;
    fibi = fib(i, fib_vector);
  }
  std::cout << "MAX is " << max <<  " and TOTAL is " << total << std::endl;
  return(0);
}

int fib(int num, std::vector<int> &fib_vector)
{
/* assumes that it is called in a loop with num starting at 0 */
  if (num < 2)
    fib_vector.push_back(num);
  else
    fib_vector.push_back(fib_vector[num - 2] + fib_vector[num - 1]);

  return fib_vector[num];
}
