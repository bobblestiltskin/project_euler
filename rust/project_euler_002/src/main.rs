fn pe002() -> usize {
    let limit:usize = 4000000;
    let mut total:usize = 0;
    let mut next:usize;
    let mut previous:usize = 1;
    let mut current:usize = 1;

    while current < limit {
        next = current + previous;
        if current % 2 == 0 {
            total += current
        }
        previous = current;
        current = next
    }
    total
}

fn main() {
    println!("{}", pe002());
}
