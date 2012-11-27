//file: pe002.java

public class pe002 {
  public static void main( String[] args ) {
    final int max = 4000000;
    int current = 1;
    int previous = 1;
    int sum = 0;
    while (current < max) {
      int next = current + previous;
      if ((current % 2) == 0) {
        sum += current;
      }
      previous = current;
      current = next;
    }
    System.out.println(sum);
  }
}
