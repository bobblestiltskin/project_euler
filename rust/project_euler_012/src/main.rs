fn get_num_divisors(num:usize) -> usize {
    let mut counter:usize = 0;
    let mut running:usize = 1;
    let fnum = num as f64;
    let fsqrt = fnum.sqrt();
    let isqrt = fsqrt as usize;
    while running <= isqrt { // we get half the divisors before the square root
        if num % running == 0 {
            counter = counter + 1;
        }
        running = running + 1;
    }
    return counter;
}

fn pe012() -> usize {
    const LAST:usize = 250;
    let mut num:usize = 0;
    let mut i:usize = 0;
    let mut j:usize = 1;

    while num < LAST {
      i = i + j;
      num = get_num_divisors(i);
      j = j +1;
    }
    i
}

fn main() {
    println!("{}", pe012())
}
