//file: pe020.java

import java.math.BigInteger;

public class pe020 {
  public static void main( String[] args ) {
    final int last = 100;
    BigInteger factorial = BigInteger.ONE;
    for (int i=0; i<last; i++)
      factorial = factorial.multiply(BigInteger.valueOf(i+1));

    String fstring = factorial.toString();
    int fsum = 0;
    for (int i = 0; i < fstring.length(); i++)
      fsum += Character.getNumericValue(fstring.charAt(i));

    System.out.println(fsum);
  }
}
