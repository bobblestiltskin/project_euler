extern crate num_bigint;
extern crate num_traits;

use num_bigint::{BigUint,ToBigUint};
use num_traits::{Zero, One};

fn pe020() -> BigUint {
    const LAST:usize = 100;
    let ten:BigUint = "10".parse::<BigUint>().unwrap();
    let mut factorial:BigUint = One::one();

    for i in 1 .. LAST {
        factorial = &factorial * i.to_biguint().unwrap();
    }

    let mut fsum:BigUint = Zero::zero();
    while factorial > ten {
        fsum = fsum + &factorial % &ten;
        factorial = factorial / &ten;
    }
    fsum = fsum + factorial;
    fsum
}

fn main() {
    println!("{}", pe020())
}
