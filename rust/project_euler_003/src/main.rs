fn pe003() -> u64 {
    let mut number:u64 = 600851475143;
    let mut max_prime:u64 = 0;
    let mut i:u64 = 3;

    while number != 1 {
        if number % i == 0 {
            max_prime = i;
            number = number / i;
        } else {
            i += 2
        }
    }
    max_prime
}

fn main() {
    println!("{}", pe003());
}
