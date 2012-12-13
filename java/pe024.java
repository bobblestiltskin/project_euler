//file: pe024.java

import java.math.BigInteger;

/*
  9! is 362880 so after all the 10 digit numbers which 
  start with 0 or 1 we will have passed 725760 of the 
  combinations. The millionth combination will start
  with a 2, since we need to count 274240 more combinations
  after 2000000000.

  8! is 40320, so there are that many 10 digit combinations starting 20.
  The combination starting 22 is invalid (since the numerals must be
  distinct), so we could count 6 sets of combinations of 40320 up to
  2700000000 and then we would have seen 725760+241920 leaving 32320 to
  find.

  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.
*/

public class pe024 {
  public static void main( String[] args ) {
    int count = 725760 + 241920 + 30240;
    final BigInteger start = new BigInteger("2780000000");
    final BigInteger end = new BigInteger("9876543210");
    BigInteger i = start.subtract(BigInteger.ONE);

    while (i.compareTo(end) < 0) {
      i = i.add(BigInteger.ONE);
      String digits = i.toString();
      if (digits.indexOf('0') == -1)
        continue;

      if (digits.indexOf('1') == -1)
        continue;

      if (digits.indexOf('2') == -1)
        continue;

      if (digits.indexOf('3') == -1)
        continue;

      if (digits.indexOf('4') == -1)
        continue;

      if (digits.indexOf('5') == -1)
        continue;

      if (digits.indexOf('6') == -1)
        continue;

      if (digits.indexOf('7') == -1)
        continue;

      if (digits.indexOf('8') == -1)
        continue;

      if (digits.indexOf('9') == -1)
        continue;
    
      count += 1;
      if (count == 1000000)
        break;
    }
    System.out.println(i);
  }
}
