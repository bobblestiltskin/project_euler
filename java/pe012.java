//file: pe012.java

import java.util.*;

public class pe012 {
  private static int get_num_divisors(final int num) {
    int counter = 0;
    int running = 1;
    while (running <= Math.sqrt(num)) {
      if ((num % running) == 0)
        counter++;
      running++;
    }
    return counter;
  }

  public static void main( String[] args ) {
    final int last = 250;
    int num = 0;
    int i = 0;
    int j = 1;
      
    while (num < last) {
      i = i + j;
      num = get_num_divisors(i);
      j++;
    }

    System.out.println(i);
  }
}
