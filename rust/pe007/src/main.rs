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

fn pe007() -> u64 {
    let primenum:u64 = 10001;
    let mut primes = vec![2,3];

    let mut test = primes[primes.len() - 1] + 2;
    while (primes.len() as u64) < primenum {
        if is_prime(test as u64, &primes) {
            primes.push(test as u64)
        }
        test += 2
    }
    primes[primes.len() - 1]
}

fn main() {
    /*
    let v1 = vec![2,3,5];
    println!("{}", is_prime(15, v1));
    let v2 = vec![2,3,5];
    println!("{}", is_prime(16, v2));
    let v3 = vec![2,3,5];
    println!("{}", is_prime(17, v3));
    */
    println!("{}", pe007())
}
