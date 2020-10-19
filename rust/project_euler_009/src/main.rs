fn pe009() -> usize {
    let stop:usize = 1000;

    for a in 0 .. stop {
        for b in a+1 .. stop {
            for c in b+1 .. stop {
                if a+b+c == stop {
                    if a*a + b*b == c*c {
                        return a*b*c
                    }
                }
            }
        }
    }
    0
}

fn main() {
    println!("{}", pe009())
}
