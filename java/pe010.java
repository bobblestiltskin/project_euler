//file: pe010.java

import java.util.*;
import java.math.BigInteger;

public class pe010 {
  private static boolean is_prime(final int test, final ArrayList primes) {
    int root = (int)Math.sqrt(test);
    Object iprimes[] = primes.toArray(); 

    for (int i=0; i < iprimes.length; i++) {
      if (((Integer) iprimes[i]).intValue() > root)
        return true;
      if ((test % (((Integer) iprimes[i]).intValue())) == 0)
        return false;
    }
    return false;
  }

  public static void main( String[] args ) {
    final int last = 2000000;

    ArrayList<Integer> primes = new ArrayList<Integer>();
    primes.add(2);

    BigInteger psum = BigInteger.valueOf(2);
    for (int test = 3; test < last; test += 2) {
      if (is_prime(test, primes)) {
        primes.add(test);
        psum = psum.add(BigInteger.valueOf(test));
      }
    }

    System.out.println(psum);
  }
}
