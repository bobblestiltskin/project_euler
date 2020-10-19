fn isprime(num:usize) -> bool {
    let mut divisor:usize = 3;
    if num % 2 == 1 {
        if num < 8 {
            if num == 1 {
                return false
            } else {
                return true;
            }
        } else {
            while divisor * divisor <= num {
                if num % divisor == 0 {
                    return false
                }
                divisor += 2;
            }
            return true;
        }
    } else {
        return num == 2;
    }
}

fn pe005() -> usize {
    let max:usize = 20;
    let mut i:usize = 2;
    let mut try_product:bool = true;
    let mut total:usize = 1;
    let mut tmp:usize;
    let mut last:usize;

    while i < max {
        if isprime(i) {
            if try_product {
                if i * i > max {
                    try_product = false;
                } else {
                    tmp = i;
                    last = tmp;
                    while tmp <= max {
                        last = tmp;
                        tmp *= i;
                    }
                    total *= last;
                }
            }
            if ! try_product {
                total *= i;
            }
        }
        i += 1
    }
    total
}

fn main() {
    println!("{}", pe005())
}
