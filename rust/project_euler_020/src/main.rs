extern crate num_bigint;
//extern crate num_traits;

use num_bigint::{BigUint,ToBigUint};
//use num_bigint::{Zero, One};

fn pe020() -> BigUint {
    let zero:BigUint = "0".parse::<BigUint>().unwrap();
    let one:BigUint = "1".parse::<BigUint>().unwrap();

    const LAST:usize = 100;
    let ten:BigUint = "10".parse::<BigUint>().unwrap();
    let mut factorial:BigUint = one;
    //let mut factorial:BigUint = One::one();

    for i in 1 .. LAST {
        factorial = &factorial * i.to_biguint().unwrap();
    }

    //let mut fsum:BigUint = Zero::zero();
    let mut fsum:BigUint = zero;
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
