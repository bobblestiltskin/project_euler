//file: pe014.java

import java.math.BigInteger;

public class pe014 {
  private static BigInteger next_term(final BigInteger num) {
    BigInteger retval = BigInteger.ZERO;
    BigInteger two = BigInteger.valueOf(2);
    if (num.mod(two) == BigInteger.ONE)
      retval = num.add(num.add(num.add(BigInteger.ONE)));
    else
      retval = num.divide(two);

    return retval;
  }

  public static void main( String[] args ) {
    final int last = 1000000;
    int maxv = 0;
    int maxi = 0;

    for (int i = last >> 1; i < last; i++) {
    System.out.println("i is " + i);
      int counter = 0;
      BigInteger j = BigInteger.valueOf(i);
      while (j.compareTo(BigInteger.ONE) != 0) {
        j = next_term(j);
//    System.out.println("j is " + j);
        counter++;
      }

      counter++;
      if (counter > maxv) {
        maxv = counter;
        maxi = i;
      }
    }
    System.out.println(maxi);
  }
}
