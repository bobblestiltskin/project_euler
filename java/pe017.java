//file: pe017.java

public class pe017 {
  public static void main( String[] args ) {
    final String onek = "one thousand";
    final int hcount = 7; // "hundred" 
    final int handcount = 10; // "hundred and "
    final String [] units = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
    final String [] tens = {"ten", "eleven", "twelve", "thirteen",
      "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
      "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour",
      "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
      "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour",
      "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
      "forty", "fortyone", "fortytwo", "fortythree", "fortyfour",
      "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
      "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour",
      "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
      "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour",
      "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
      "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour",
      "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
      "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour",
      "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
      "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour",
      "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"};

    int count = 0;
    
    for (int i = 0; i < units.length; i++)
      count += units[i].length();

    for (int i = 0; i < tens.length; i++)
      count += tens[i].length();

    for (int i = 0; i < units.length; i++) {
      count += units[i].length() + hcount;
      for (int j = 0; j < units.length; j++)
        count += units[i].length() + handcount + units[j].length();
      for (int j = 0; j < tens.length; j++)
        count += units[i].length() + handcount + tens[j].length();
    }

    count += onek.length() - 1; // contains a space
    System.out.println(count);
  }
}
