// This is a solution for http://projecteuler.net/problem=23

#include <cstdio>
#include <cmath>
#include <vector>
#include <map>

int sum_factors(int number);

int main() {
  const int MAX = 28123;
  std::vector<int> abundant;
  std::map<int,int> amap;

  for (int i = 1; i < MAX; ++i) {
    int fsum = sum_factors(i);
    if (i < fsum) {
      abundant.push_back(i);
      amap[i] = fsum;
    }
  }

  int sum = 0;
  for (int i = 1; i < abundant.at(0); ++i)
    sum += i;
  for (int i = abundant.at(0); i < MAX; ++i) {
    int addi = 1;
    for (std::vector<int>::iterator jt = abundant.begin();
         *jt < i;
         jt++) {
      if (amap[i - *jt]) {
        addi = 0;
        break;
      }
    }
    if (addi)
      sum += i;
  }
  printf("%d\n", sum);
  return(0);
}

int sum_factors(int number) {
  int sum = 1;
  int i;
  for (i = 2; i <= sqrt(number); ++i) {
    if (!(number % i)) {
      int divisor = number / i;
      sum += i;
      if (i != divisor)
        sum += divisor;
    }
  }
  return sum;
}
