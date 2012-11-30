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
    final BigInteger big_number = new BigInteger("600851475143");
    int max_prime = 0;
    int counter = 2;
    BigInteger counter_squared = BigInteger.valueOf(counter).pow(2);
    while (counter_squared.compareTo(big_number) < 0) {
      if (big_number.mod(BigInteger.valueOf(counter)).intValue() == 0) {
        BigInteger divi = big_number.divide(BigInteger.valueOf(counter));
        max_prime = set_max_prime(BigInteger.valueOf(counter), max_prime);
        max_prime = set_max_prime(divi, max_prime);
      }
      counter++;
      counter_squared = BigInteger.valueOf(counter).pow(2);
    }
    System.out.println(max_prime);
  }
}
