fn pe001() -> u64 {
    let imax:u64 = 1000;
    let mut total:u64 = 0;

    for i in 0 .. imax {
        if i % 3 == 0 || i % 5 == 0 {
            total += i
        }
    }
    total
}

fn main() {
    println!("{}", pe001())
}
