fn pe019() -> usize {
    let cycle = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    let mut count = 0;
    let mut dow = 2;  // start on tuesday 1901.1.1. 2000 is a leap year too!

    for _i in 0 .. 25 {
        for j in 0 .. cycle.len() {
            if dow == 0 {
                count = count + 1;
            }
            dow = (dow + cycle[j]) % 7;
        }
    }
    count
}

fn main() {
    println!("{}", pe019())
}
