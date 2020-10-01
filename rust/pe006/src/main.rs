fn pe006() -> usize {
    let imax:usize = 101;
    let sqsum:usize = (imax * 50) * (imax * 50);
    let mut sumsq:usize = 0;

    for i in 0 .. imax {
        sumsq += i * i;
    }
    sqsum - sumsq
}

fn main() {
    println!("{}", pe006())
}
