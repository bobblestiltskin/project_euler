fn sum_factors(number:usize) -> usize {
    let mut total:usize = 1;
    let limit:usize = (number as f64).sqrt() as usize;
    for i in 2 .. limit {
        if number % i == 0 {
            total = total + i + (number / i);
        }
    }
    total
}

fn pe021() -> usize {
    const SIZE:usize = 10000;
    let mut spd = Vec::new();
    for i in 0 .. SIZE {
        spd.push(sum_factors(i));
    }
    let mut result:usize = 0;
    for i in 0 .. SIZE {
        if spd[i] < SIZE {
            if i != spd[i] {
                if spd[spd[i]] == i {
                    result = result + i;
                }
            }
        }
    }
    result
}

fn main() {
    println!("{}", pe021())
}
