//file: pe003.java

import java.math.BigInteger;

public class pe003 {
  private static int maxp( BigInteger imax, int max_prime ) {
    int inner_counter = 2;
    BigInteger ics = BigInteger.valueOf(inner_counter).pow(2);
    boolean matched = false;
    while ((matched == false) && (ics.compareTo(imax) < 0)) {
      if (imax.mod(BigInteger.valueOf(inner_counter)).intValue() == 0) {
        matched = true;
      }
      inner_counter++;
      ics = BigInteger.valueOf(inner_counter).pow(2);
    }
    if ((matched == false) && (imax.intValue() > max_prime)) {
      max_prime = imax.intValue();
    }
    return max_prime;
  }

  public static void main( String[] args ) {
    final BigInteger big_number = new BigInteger("600851475143");
    int max_prime = 0;
    BigInteger counter = new BigInteger("2"); // our counter only needs to be long??
    BigInteger counter_squared = counter.pow(2);
    while (counter_squared.compareTo(big_number) < 0) {
      BigInteger divi = BigInteger.ZERO;
      if (big_number.mod(counter).intValue() == 0) {
        divi = big_number.divide(counter);
        max_prime = maxp(counter, max_prime);
        max_prime = maxp(divi, max_prime);
      }
      counter = counter.add(BigInteger.ONE); // counter++
      counter_squared = counter.pow(2);
    }
    System.out.println(max_prime);
  }
}
