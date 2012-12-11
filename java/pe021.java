//file: pe021.java

import java.util.*;

public class pe021 {
  private static int sum_factors(final int number) {
    int total = 1;
    for (int i = 2; i < (int)Math.sqrt(number); i++) {
      if ((number % i) == 0)
        total += (i + (number / i));
    }
    return total;
  }

  public static void main( String[] args ) {
    final int SIZE = 10000;

    ArrayList<Integer> spd = new ArrayList<Integer>();
    for (int i = 0; i < SIZE; i++)
      spd.add(sum_factors(i));

    int result = 0;
    for (int i = 0; i < SIZE; i++) {
      if (spd.get(i) < SIZE) {
        if (i != spd.get(i)) {
          if (spd.get(spd.get(i)) == i)
            result += i;
        }
      }
    }
     
    System.out.println(result);
  }
}
