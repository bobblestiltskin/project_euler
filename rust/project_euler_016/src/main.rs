fn double_vec(bigint: &mut Vec<u8>) -> &mut Vec<u8> {
    // this takes a vector of bytes (each a digit) 
    // and returns it doubled, extending it if necessary
    // we store it backwards so we can extend it rightwards as it grows
    // 64 is stored as {4, 6}, 128 is stored as {8, 2, 1}

    let mut carry:u8 = 0;
    let mut extend:bool = false;

    if bigint[bigint.len() - 1] > 4 {
        extend = true;
    }

    for i in 0 .. bigint.len() {
        if bigint[i] < 5 {
            bigint[i] = bigint[i] + bigint[i] + carry;
            if carry == 1 {
                carry = 0;
            }
        } else {
            bigint[i] = (bigint[i] + bigint[i] + carry) % 10;
            carry = 1;
        }
    }

    if extend {
        bigint.push(1);
    }

    bigint
}

fn pe016() -> usize {
    // we could look at a more high-level language implementation
    // to use the .with_capacity function to pre-extend the vector.
    // But that feels like cheating if I want to compare the 
    // performance of the languages ...

    const LIMIT:u32 = 1000;
    let mut v:Vec<u8> = vec![1];

    for _x in 0 .. LIMIT {
      v = double_vec(&mut v).to_vec();
    }

    let mut retval:usize = 0;
    for i in 0 .. v.len() {
        retval = retval + v[i] as usize;
    }

    retval
}

fn main() {
    println!("{}", pe016())
}
