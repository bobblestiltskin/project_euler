//file: pe006.java

public class pe006 {
  public static void main( String[] args ) {
    int sumsq = 0;
    for (int i = 0; i < 100; ++i) {
      sumsq += (i+1) * (i+1);
    }

    int sqsum = (101 * 50) * (101 * 50);
    int result = sqsum - sumsq;

    System.out.println(result);
  }
}
