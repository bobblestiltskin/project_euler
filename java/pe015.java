//file: pe015.java

import java.util.*;
import java.math.BigInteger;

public class pe015 {
  public static void main( String[] args ) {
    final int max = 20;
//  need to compute 2n!/((n!)*(n!))
    ArrayList<Integer> numerator = new ArrayList<Integer>();
    ArrayList<Integer> denominator = new ArrayList<Integer>();
    for (int i = 0; i < max; i++) {
      denominator.add(i+1);
      numerator.add(i+max+1);
    }

/*
  walk through lists and cast away multiples to reduce size of numbers from
  factorials - this is incomplete factoring but sufficient for this problem
  we could factor both completely if we wanted...
*/

    for (int i=0; i < max; i++) {
      for (int j=0; j < max; j++) {
        if ((denominator.get(i) != 1) && ((numerator.get(j) % denominator.get(i)) == 0)) {
          numerator.set(j, (numerator.get(j) / denominator.get(i)));
          denominator.set(i, 1);
        }
      }
    }

    BigInteger num = BigInteger.ONE;
    BigInteger denom = BigInteger.ONE;
    for (int i = 0; i < max; i++) {
      num = num.multiply(BigInteger.valueOf(numerator.get(i)));
      denom = denom.multiply(BigInteger.valueOf(denominator.get(i)));
    }
  
    System.out.println((num.divide(denom)).longValue());
  }
}
