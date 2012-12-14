//file: pe025.java

import java.math.BigInteger;
import java.util.*;

public class pe025 {
  public static ArrayList<BigInteger> fib(int n,  ArrayList<BigInteger> vector) {
    if (n < 2)
      vector.add(BigInteger.valueOf(n));
    else
      vector.add(vector.get(n-2).add(vector.get(n-1)));

    return vector;
  }

  public static void main( String[] args ) {
    int limit = 1000;
    int i = 0;
    ArrayList<BigInteger> vector = new ArrayList<BigInteger>();
    vector = fib(i, vector);
    while (vector.get(i).toString().length() < limit)
      vector = fib(++i, vector);

    System.out.println(i);
  }
}
