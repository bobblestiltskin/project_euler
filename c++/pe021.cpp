// This is a solution for http://projecteuler.net/problem=21

#include <cstdio>
#include <cmath>

const int SIZE = 10000;

int sum_factors(int number);

int main() {
  int sumproperdivisors[SIZE];
  int i;
  for (i = 0; i < SIZE; ++i)
    sumproperdivisors[i] = sum_factors(i);

  int total = 0;
  for (i = 0; i < SIZE; ++i)
    if ((sumproperdivisors[i] < SIZE) && (i != sumproperdivisors[i])
         && (sumproperdivisors[sumproperdivisors[i]] == i))
      total += i;

  printf("%d\n", total);
  return 0;
}

int sum_factors(int number) {
  int sum = 1;
  int i;
  for (i = 2; i <= sqrt(number); ++i)
    if (!(number % i))
      sum += (i + (number / i));

  return sum;
}
