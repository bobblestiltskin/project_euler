//file: pe007.java

import java.util.*;

public class pe007 {
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
    final int primenum = 10001;

    ArrayList primes = new ArrayList();
    primes.add(2);
    primes.add(3);

    int test = 5;
    while (primes.size() < primenum) {
      if (is_prime(test, primes))
        primes.add(test);
      test += 2;
    }
    Object iprimes[] = primes.toArray(); 
    System.out.println(iprimes[iprimes.length - 1]);
  }
}
