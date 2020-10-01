fn pe001() -> usize {
    let imax:usize = 1000;
    let mut total:usize = 0;

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
