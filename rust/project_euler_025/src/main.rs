const IMAX:usize = 1000;

extern crate num_bigint;
use num_bigint::{BigUint,ToBigUint};

fn fib(num:usize, mut vector:Vec<BigUint>) -> Vec<BigUint> {
    if num < 2 {
        vector.push(num.to_biguint().unwrap());
    } else {
        vector.push(&vector[num - 2] + &vector[num - 1]);
    }
    vector
}

fn pe025() -> usize {
    let mut index:usize = 0;
    let mut vector:Vec<BigUint> = vec![];
    vector = fib(index, vector);
    while vector[index].to_string().len() < IMAX {
        index = index + 1;
        vector = fib(index, vector);
    }
    index
}

fn main() {
    println!("{}", pe025())
}
