fn is_prime(test: u64, primes: &Vec<u64>) -> bool {
    let root = (test as f64).sqrt();
    let introot = root.floor() as u64;

    for i in primes {
        if i > &introot {
            return true
        }
        if test % i == 0 {
            return false
        }
    }
    return true
}

fn pe010() -> u64 {
    let last:u64 = 2000000;
    let mut primes = vec![2];

    let mut psum:u64 = 2;
    let mut test:u64 = 3;
    while test < last {
        if is_prime(test, &primes) {
            primes.push(test as u64);
            psum += test;
        }
        test += 2;
    }
    psum
}

fn main() {
    println!("{}", pe010())
}
