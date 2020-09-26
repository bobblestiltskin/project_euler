fn pe002() -> u64 {
    let limit:u64 = 4000000;
    let mut total:u64 = 0;
    let mut next:u64;
    let mut previous:u64 = 1;
    let mut current:u64 = 1;

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
