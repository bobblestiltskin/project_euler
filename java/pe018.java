//file: pe018.java

import java.util.*;

public class pe018 {
  public static void main( String[] args ) {
    final int [] row1 = {75};
    final int [] row2 = {95, 64};
    final int [] row3 = {17, 47, 82};
    final int [] row4 = {18, 35, 87, 10};
    final int [] row5 = {20,  4, 82, 47, 65};
    final int [] row6 = {19,  1, 23, 75,  3, 34};
    final int [] row7 = {88,  2, 77, 73,  7, 63, 67};
    final int [] row8 = {99, 65,  4, 28,  6, 16, 70, 92};
    final int [] row9 = {41, 41, 26, 56, 83, 40, 80, 70, 33};
    final int [] row10 = {41, 48, 72, 33, 47, 32, 37, 16, 94, 29};
    final int [] row11 = {53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14};
    final int [] row12 = {70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57};
    final int [] row13 = {91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48};
    final int [] row14 = {63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31};
    final int [] row15 = { 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23};
    final int [][] data = {row1, row2, row3, row4, row5, row6, row7, row8, row9,
      row10, row11, row12, row13, row14, row15};

// we process the data from the bottom of the triangle and compute the maximum of adjacent 
// values and add these maxima to the previous row and iterate
   
    ArrayList<Integer> keep_data = new ArrayList<Integer>();
    for (int j = 0; j < data.length; j++)
      keep_data.add(data[data.length - 1][j]);
    
    for (int i = data.length - 1; i > 0; i--) {
      ArrayList<Integer> new_data = new ArrayList<Integer>();
      for (int j = 0; j < i; j++) {
        int newv = data[i-1][j] + Math.max(keep_data.get(j), keep_data.get(j+1));
        new_data.add(newv);
      }
      keep_data = new_data;
    }
    System.out.println(keep_data.get(0));
  }
}
