// Copyright 2012 Bob Wilkinson <bob@fourtheye.org>

// This is a solution for http://projecteuler.net/problem=18

#include <cstdio>
#include <algorithm>
#include <vector>

int main() {
  std::vector<int> row1({75});
  std::vector<int> row2({95, 64});
  std::vector<int> row3({17, 47, 82});
  std::vector<int> row4({18, 35, 87, 10});
  std::vector<int> row5({20,  4, 82, 47, 65});
  std::vector<int> row6({19,  1, 23, 75,  3, 34});
  std::vector<int> row7({88,  2, 77, 73,  7, 63, 67});
  std::vector<int> row8({99, 65,  4, 28,  6, 16, 70, 92});
  std::vector<int> row9({41, 41, 26, 56, 83, 40, 80, 70, 33});
  std::vector<int> row10({41, 48, 72, 33, 47, 32, 37, 16, 94, 29});
  std::vector<int> row11({53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14});
  std::vector<int> row12({70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57});
  std::vector<int> row13({91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48});
  std::vector<int> row14({63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40,
                          31});
  std::vector<int> row15({ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,
                          4, 23});

  std::vector< std::vector<int> > data({row1,
    row2, row3, row4, row5, row6, row7, row8, row9, row10,
    row11, row12, row13, row14, row15});

// we process the data from the bottom of the triangle and compute the maximum
// of adjacent values and add these maxima to the previous row and iterate
  for (int i = data.size(); i > 0; --i)
    for (int j = 0; j < (i - 1); ++j)
      data[i-2][j] += std::max(data[i-1][j], data[i-1][j+1]);

  printf("%d\n", data[0][0]);

  return 0;
}
