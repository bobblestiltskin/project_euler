const START:usize = 2780000000;
const END:usize = 9876543210;
const MAXNUM:usize = 1000000;

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

fn pe024() -> usize {
    let mut count:usize = 725760 + 241920 + 30240;
    let mut num:usize = START - 1;

    while num < END {
        num = num + 1;
        let digits = num.to_string();
        if digits.find('0').is_some() &&
           digits.find('1').is_some() &&
           digits.find('2').is_some() &&
           digits.find('3').is_some() &&
           digits.find('4').is_some() &&
           digits.find('5').is_some() &&
           digits.find('6').is_some() &&
           digits.find('7').is_some() &&
           digits.find('8').is_some() &&
           digits.find('9').is_some() {
            count = count + 1;
            if count == MAXNUM {
                break
            }
        }
    }
    num
}

fn main() {
    println!("{}", pe024())
}
