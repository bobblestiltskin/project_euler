//file: pe003.java

import java.math.BigInteger;

public class pe003 {
  public static void main( String[] args ) {
    BigInteger big_number = new BigInteger("600851475143");
    int max_prime = 0;
    int counter = 2;
    while (big_number.intValue() != 1) {
      if (big_number.mod(BigInteger.valueOf(counter)).intValue() == 0) {
        max_prime = counter;
        big_number = big_number.divide(BigInteger.valueOf(counter));
      } else {
        counter++;
      }
    }
    System.out.println(max_prime);
  }
}
