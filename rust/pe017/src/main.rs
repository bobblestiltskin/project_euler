fn pe017() -> usize {
    let onek = "one thousand";
    let hcount:usize = 7; // "hundred" 
    let handcount:usize = 10; // "hundred and "
    let units = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];

    let tens = ["ten", "eleven", "twelve", "thirteen", "fourteen",
                "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
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
                "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"];

    let mut count:usize = 0;

    for i in units.iter() {
        count = count + i.len();
    }

    for i in tens.iter() {
        count = count + i.len();
    }

    for i in units.iter() {
        count = count + i.len() + hcount;
        for j in units.iter() {
            count = count + i.len() + handcount + j.len();
        }
        for j in tens.iter() {
            count = count + i.len() + handcount + j.len();
        }
    }
    count = count + onek.len() - 1;

    count
}

fn main() {
    println!("{}", pe017())
}
