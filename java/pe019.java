//file: pe019.java

public class pe019 {
  public static void main( String[] args ) {
    final int [] cycle = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                          31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                          31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                          31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    int count = 0;
    int dow = 2; // start on tuesday 1901.1.1 - 2000 is a leap year too!
    for (int i = 0; i < 25; i++) {
      for (int j = 0; j < cycle.length; j++) {
        if (dow == 0)
          count++;
        dow = (dow + cycle[j]) % 7;
      }
    }
    System.out.println(count);
  }
}
