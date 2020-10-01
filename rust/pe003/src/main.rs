fn pe003() -> usize {
    let mut number:usize = 600851475143;
    let mut max_prime:usize = 0;
    let mut i:usize = 3;

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
