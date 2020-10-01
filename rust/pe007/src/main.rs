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
