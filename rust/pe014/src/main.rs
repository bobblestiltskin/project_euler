fn next_term(num:usize) -> usize {
  if num % 2 == 1 {
    return num + num + num + 1;
  } else {
    return num >> 1;
  }
}

fn pe014() -> usize {
    const LAST:usize = 1000000;
    const HALFLAST:usize = 500000;

    let mut maxi:usize = 0;
    let mut maxv:usize = 0;

    for i in HALFLAST .. LAST {
        let mut counter:usize = 0;
        let mut j:usize = i;
        while j != 1 {
            j = next_term(j);
            counter = counter + 1;
        }
        counter = counter + 1;

        if counter > maxv {
            maxv = counter;
            maxi = i;
        }
    }
    maxi
}

fn main() {
    println!("{}", pe014())
}
