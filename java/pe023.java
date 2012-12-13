//file: pe023.java

import java.util.*;

public class pe023 {
  public static int sum_factors(int number) {
    int sum = 1;
    int i;
    for (i = 2; i <= Math.sqrt(number); ++i) {
      if ((number % i) == 0) {
        int divisor = number / i;
        sum += i;
        if (i != divisor)
          sum += divisor;
      }
    }
    return sum;
  }

  public static void main( String[] args ) {
    final int MAX = 28123;
    List<Integer> abundant = new Vector<Integer>();
    Map<Integer, Integer> amap = new HashMap<Integer, Integer>();

    for (int i = 1; i < MAX; ++i) {
      int fsum = sum_factors(i);
      if (i < fsum) {
        abundant.add(i);
          amap.put(i, fsum);
      }
    }

    int sum = 0;
    for (int i = 1; i < abundant.get(0); ++i)
      sum += i;

    for (int i = abundant.get(0); i < MAX; ++i) {
      boolean addi = true;
      Iterator jt = abundant.iterator();
      while (jt.hasNext()) {
        int element = ((Integer) jt.next()).intValue();
        if ((element < i) && (amap.get(i - element) != null)) {
          addi = false;
          break;
        }
      }
      if (addi)
        sum += i;
    }
    System.out.println(sum);
  }
}
