//file: pe004.java

public class pe004 {
  private static boolean is_palindromic(String number) {
    for (int i = 0; i < number.length(); i++) {
      if (number.charAt(i) != number.charAt(number.length() - (i + 1))) {
        return false;
      }
    }
    return true;
  }

  public static void main( String[] args ) {
    final int MAX3 = 999;
    final int MIN3 = 100;

    int maxp = 0;
    int mini = MIN3;
    int minj = MIN3;
    int maxj = MIN3;
    for (int i = MAX3; i >= mini; i--) {
      for (int j = maxj; j >= minj; j--) {
        int product = i * j;
        if (is_palindromic(Integer.toString(product))) {
          if (product > maxp) {
            maxp = product;
            mini = minj = product / 1000; /* optimize */
          }
        }
      }
      maxj = i;
    }
    System.out.println(maxp);
  }
}
