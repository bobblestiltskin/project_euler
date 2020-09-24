fn pe001() -> u32 {
    let imax:u32 = 1000;
    let mut total:u32 = 0;

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
