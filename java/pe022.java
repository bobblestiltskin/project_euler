//file: pe022.java

import java.io.*;
import java.util.*;

public class pe022 {
  public static void main( String[] args ) {
    ArrayList<String> names = new ArrayList<String>();
    Scanner s = null;
    try {
      File f = new File("../names.txt");
      FileReader fr = new FileReader(f); 
      BufferedReader in = new BufferedReader(fr); 
      String line = in.readLine( );
      line = line.substring(1, line.length() - 1); // drop the enclosing quotes
      s = new Scanner(line);
      s.useDelimiter("\",\"");
      while(s.hasNext()) names.add(s.next());
    }
    catch(Exception e){}  
    finally{s.close();}

    Collections.sort(names);

    int total = 0;
    for (int i = 0; i < names.size(); i++) {
      String name = names.get(i);
      int letters = 0;
      for (int j = 0; j < name.length(); j++)
        letters += ((int) name.charAt(j)) - 64;
      total += letters * (i + 1);
//      System.out.println("index is " + i + " name is " + name + " total is " + total);
    }
    System.out.println(total);
  }
}
