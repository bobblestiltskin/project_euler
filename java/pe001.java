//file: pe001.java

public class pe001 {
  public static void main( String[] args ) {
    int limit = 1000;
    int sum = 0;
    for (int i = 0; i < limit; i++) {
      if (((i % 5) == 0) || ((i % 3) == 0)) {
        sum += i;
      }
    }
    System.out.println(sum);
  }
}
