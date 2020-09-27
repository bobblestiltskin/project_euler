fn pe006() -> u64 {
    let imax:u64 = 101;
    let sqsum:u64 = (imax * 50) * (imax * 50);
    let mut sumsq:u64 = 0;

    for i in 0 .. imax {
        sumsq += i * i;
    }
    sqsum - sumsq
}

fn main() {
    println!("{}", pe006())
}
