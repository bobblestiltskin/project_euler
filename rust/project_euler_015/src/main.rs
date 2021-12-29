fn pe015() -> u64 {
    const LIMIT:usize = 20;
    let mut numerator = vec![];
    let mut denominator = vec![];
    for i in 0 .. LIMIT {
        denominator.push(i+1);
        numerator.push(i+LIMIT+1);
    }

//  walk through lists and cast away multiples to reduce size of numbers from
//  factorials - this is incomplete factoring but sufficient for this problem
//  we could factor both completely if we wanted...

    let mut den:usize;
    let mut num:usize;

    for i in 0 .. LIMIT {
        for j in 0 .. LIMIT {
            den = denominator[i];
            num = numerator[j];
            if den != 1 && num % den == 0 {
                numerator[j] = num / den;
                denominator[i] = 1;
            }
        }
    }

    let mut den64:u64;
    let mut num64:u64;

    num64 = 1;
    den64 = 1;
    for i in 0 .. LIMIT {
        num64 = num64 * numerator[i] as u64;
        den64 = den64 * denominator[i] as u64;
    }
    num64 / den64
}

fn main() {
    println!("{}", pe015())
}
