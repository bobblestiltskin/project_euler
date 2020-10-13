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

fn pe007() -> usize {
    let primenum:usize = 10001;
    let mut primes = vec![2,3];

    let mut test = primes[primes.len() - 1] + 2;
    while (primes.len() as usize) < primenum {
        if is_prime(test as usize, &primes) {
            primes.push(test as usize)
        }
        test += 2
    }
    primes[primes.len() - 1]
}

fn main() {
    println!("{}", pe007())
}
