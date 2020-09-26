fn is_palindromic(digits: String) -> bool {
    // XXX a naive implementation- look at DoubleEndedIterator ?
    let digitvec: Vec<char> = digits.chars().collect();
    let mut result:bool = true;
    for i in 0 .. digits.len() {
        if digitvec[i] != digitvec[digits.len() - (i+1)] {
            result = false
        }
    }
    result
}

fn pe004() -> u64 {
    let max3:u64 = 999;
    let min3:u64 = 100;
    let mut maxp:u64 = 0;

    let mini:u64 = min3;
    let mut minj:u64 = min3;
    let mut maxj:u64 = max3;
    let mut product:u64;

    for i in (mini .. max3).rev() {
        for j in (minj .. maxj).rev() {
            product = i * j;
            if is_palindromic(product.to_string()) {
                if product > maxp {
                    maxp = product;
                    minj = product / 1000;
                }
            }
        }
        maxj = i;
    }
    maxp
}

/*
fn main() {
    println!("{}", is_palindromic("level".to_string()));
    println!("{}", is_palindromic("banana".to_string()));
    println!("{}", is_palindromic("noon".to_string()))
}
*/

fn main() {
    println!("{}", pe004())
}
