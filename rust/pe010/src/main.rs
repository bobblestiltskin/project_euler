fn is_prime(test: usize, primes: &Vec<usize>) -> bool {
    let root = (test as f64).sqrt();
    let introot = root.floor() as usize;

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

fn pe010() -> usize {
    let last:usize = 2000000;
    let mut primes = vec![2];

    let mut psum:usize = 2;
    let mut test:usize = 3;
    while test < last {
        if is_prime(test, &primes) {
            primes.push(test as usize);
            psum += test;
        }
        test += 2;
    }
    psum
}

fn main() {
    println!("{}", pe010())
}
