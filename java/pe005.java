//file: pe005.java

public class pe005 {
  public static boolean isprime(int num) {
    if ((num % 2) == 1) {
      if (num < 8) {
        return !(num == 1);
      } else {
        int divisor = 3;
        while ((divisor * divisor) <= num) {
          if ((num % divisor) == 0)
            return false;
          divisor += 2;
        }
        return true;
      }
    } else {
      return num == 2;
    }
  }
  public static void main( String[] args ) {
    final int MAX=20;
    int i = 2;
    boolean try_product = true;
    int total = 1;
    while (i <= MAX) {
      if (isprime(i)) {
        if (try_product) {
          if ((i * i) > MAX) {
            try_product = false;
          } else {
            int tmp = i;
            int last = tmp;
            while (tmp <= MAX) {
              last = tmp;
              tmp *= i;
            }
            total *= last;
          }
        }
        if (!(try_product))
          total *= i;
      }
      i++;
    }
    System.out.println(total);
  }
}
