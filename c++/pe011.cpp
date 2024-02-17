// This is a solution for http://projecteuler.net/problem=11

#include <cstdio>
#include <string>
#include <vector>

int compute_point(const std::vector< std::vector<int> > &, const int,
                  const int, std::string &);

int main() {
  const int ASIZE = 26;  // allow 3 around each edge

  const int array[ASIZE][ASIZE] = {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  // NOLINT
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  // NOLINT
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  // NOLINT
    {0, 0, 0, 8, 2, 22, 97, 38, 15, 0, 40, 0, 75, 4, 5, 7, 78, 52, 12, 50, 77, 91, 8, 0, 0, 0},  // NOLINT
    {0, 0, 0, 49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48, 4, 56, 62, 0, 0, 0, 0},  // NOLINT
    {0, 0, 0, 81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30, 3, 49, 13, 36, 65, 0, 0, 0},  // NOLINT
    {0, 0, 0, 52, 70, 95, 23, 4, 60, 11, 42, 69, 24, 68, 56, 1, 32, 56, 71, 37, 2, 36, 91, 0, 0, 0},  // NOLINT
    {0, 0, 0, 22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80, 0, 0, 0},  // NOLINT
    {0, 0, 0, 24, 47, 32, 60, 99, 3, 45, 2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50, 0, 0, 0},  // NOLINT
    {0, 0, 0, 32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70, 0, 0, 0},  // NOLINT
    {0, 0, 0, 67, 26, 20, 68, 2, 62, 12, 20, 95, 63, 94, 39, 63, 8, 40, 91, 66, 49, 94, 21, 0, 0, 0},  // NOLINT
    {0, 0, 0, 24, 55, 58, 5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72, 0, 0, 0},  // NOLINT
    {0, 0, 0, 21, 36, 23, 9, 75, 0, 76, 44, 20, 45, 35, 14, 0, 61, 33, 97, 34, 31, 33, 95, 0, 0, 0},  // NOLINT
    {0, 0, 0, 78, 17, 53, 28, 22, 75, 31, 67, 15, 94, 3, 80, 4, 62, 16, 14, 9, 53, 56, 92, 0, 0, 0},  // NOLINT
    {0, 0, 0, 16, 39, 5, 42, 96, 35, 31, 47, 55, 58, 88, 24, 0, 17, 54, 24, 36, 29, 85, 57, 0, 0, 0},  // NOLINT
    {0, 0, 0, 86, 56, 0, 48, 35, 71, 89, 7, 5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58, 0, 0, 0},  // NOLINT
    {0, 0, 0, 19, 80, 81, 68, 5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77, 4, 89, 55, 40, 0, 0, 0},  // NOLINT
    {0, 0, 0, 4, 52, 8, 83, 97, 35, 99, 16, 7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66, 0, 0, 0},  // NOLINT
    {0, 0, 0, 88, 36, 68, 87, 57, 62, 20, 72, 3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69, 0, 0, 0},  // NOLINT
    {0, 0, 0, 4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18, 8, 46, 29, 32, 40, 62, 76, 36, 0, 0, 0},  // NOLINT
    {0, 0, 0, 20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74, 4, 36, 16, 0, 0, 0},  // NOLINT
    {0, 0, 0, 20, 73, 35, 29, 78, 31, 90, 1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57, 5, 54, 0, 0, 0},  // NOLINT
    {0, 0, 0, 1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52, 1, 89, 19, 67, 48, 0, 0, 0},  // NOLINT
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  // NOLINT
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  // NOLINT
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},  // NOLINT
  };

  std::vector< std::vector<int> > a(ASIZE, std::vector<int>(ASIZE));
  for (int i = 0; i < ASIZE; ++i)
    a[i].assign(array[i], array[i] + ASIZE);

  int max = 0;
  std::string type;
/*
of course the matrix is stored upside down in memory cf with normal
mathematical representation so we decrement our row counter and
increment the column counter so then our 1,1 is the lower-left cell
*/
  for (unsigned int i = a.size() - 4; i > 2; --i) {
    for (unsigned int j = 3; j < a.front().size() - 3; ++j) {
      std::string ttype;
      int point = compute_point(a, i, j, ttype);
      if (point > max) {
        max = point;
        type = ttype;
      }
    }
  }
  printf("%d\n", max);

  return 0;
}

int compute_point(const std::vector< std::vector<int> > & a, const int i,
    const int j, std::string & type) {
  int n;
  int max = 0;

/* north */
  n = a.at(i).at(j) * a.at(i - 1).at(j)
      * a.at(i - 2).at(j) * a.at(i - 3).at(j);
  if (n > max) {
    max = n;
    type = "north";
  }

/* northeast */
  n = a.at(i).at(j) * a.at(i - 1).at(j + 1)
      * a.at(i - 2).at(j + 2) * a.at(i - 3).at(j + 3);
  if (n > max) {
    max = n;
    type = "northeast";
  }

/* east */
  n = a.at(i).at(j) * a.at(i).at(j + 1)
      * a.at(i).at(j + 2) * a.at(i).at(j + 3);
  if (n > max) {
    max = n;
    type = "east";
  }

/* southeast */
  n = a.at(i).at(j) * a.at(i + 1).at(j + 1)
      * a.at(i + 2).at(j + 2) * a.at(i + 3).at(j + 3);
  if (n > max) {
    max = n;
    type = "southeast";
  }

/* south */
  n = a.at(i).at(j) * a.at(i + 1).at(j)
      * a.at(i + 2).at(j) * a.at(i + 3).at(j);
  if (n > max) {
    max = n;
    type = "south";
  }

/* southwest */
  n = a.at(i).at(j) * a.at(i + 1).at(j - 1)
      * a.at(i + 2).at(j - 2) * a.at(i + 3).at(j - 3);
  if (n > max) {
    max = n;
    type = "southwest";
  }

/* west */
  n = a.at(i).at(j) * a.at(i).at(j - 1)
      * a.at(i).at(j - 2) * a.at(i).at(j - 3);
  if (n > max) {
    max = n;
    type = "west";
  }

/* northwest */
  n = a.at(i).at(j) * a.at(i - 1).at(j - 1)
      * a.at(i - 2).at(j - 2) * a.at(i - 3).at(j - 3);
  if (n > max) {
    max = n;
    type = "northwest";
  }

  return max;
}
