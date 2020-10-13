use std::collections::BTreeMap;

const MAX:usize = 28123;

fn sum_factors(number:usize) -> usize {
    let mut asum:usize = 1;
    let imax:usize = ((number as f64).sqrt() as usize) + 1;
    for i in 2 .. imax {
        if number % i == 0 {
            let divisor = number / i;
            asum = asum + i;
            if i != divisor {
                asum = asum + divisor;
            }
        }
    }
    asum
}

fn pe023() -> usize {
    let mut abundant:Vec::<usize> = vec![];
    let mut abundant_map = BTreeMap::new();
    
    for i in 1 .. MAX {
        let sf:usize = sum_factors(i);
        if i < sf {
            abundant.push(i);
            abundant_map.insert(i, sf);
        }
    }
     
    let mut sum:usize = 0;
    for i in 1 .. abundant[0] {
        sum = sum + i;
    }

    for i in abundant[0] .. MAX {
        let mut addi:bool = true;
        for j in &abundant {
            if *j < i {
              if abundant_map.contains_key(&(i-*j)) {
                  addi = false;
                  break;
              }
            }
        }
        if addi {
            sum = sum + i;
        }
    }
    sum
}

fn main() {
    println!("{}", pe023())
}
