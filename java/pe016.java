//file: pe016.java

import java.math.BigInteger;

public class pe016 {
  public static void main( String[] args ) {
    final int limit = 1000;

    BigInteger num = BigInteger.valueOf(2);
    num = num.pow(limit);
    String numstring = num.toString();
    int ssum = 0;
    for (int i = 0; i < numstring.length(); i++)
      ssum += Character.getNumericValue(numstring.charAt(i));

    System.out.println(ssum);
  }
}
