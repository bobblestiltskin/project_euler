//file: pe003.java

import java.math.BigInteger;

public class pe003 {
  private static int set_max_prime( BigInteger imax, int max_prime ) {
    int inner_counter = 2;
    BigInteger ics = BigInteger.valueOf(inner_counter).pow(2);
    boolean isPrime = true;
    while (isPrime && (ics.compareTo(imax) < 0)) {
      if (imax.mod(BigInteger.valueOf(inner_counter)).intValue() == 0) {
        isPrime = false;
      }
      inner_counter++;
      ics = BigInteger.valueOf(inner_counter).pow(2);
    }
    if (isPrime && (imax.intValue() > max_prime)) {
      max_prime = imax.intValue();
    }
    return max_prime;
  }

  public static void main( String[] args ) {
    BigInteger big_number = new BigInteger("600851475143");
    int max_prime = 0;
    int counter = 2;
    while (big_number.intValue() != 1) {
      if (big_number.mod(BigInteger.valueOf(counter)).intValue() == 0) {
        max_prime = set_max_prime(BigInteger.valueOf(counter), max_prime);
        big_number = big_number.divide(BigInteger.valueOf(counter));
      }
      counter++;
    }
    System.out.println(max_prime);
  }
}
