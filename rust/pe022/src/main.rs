use std::io::Read;

fn pe021() -> usize {
    let mut file = std::fs::File::open("../../names.txt").unwrap();
    let mut contents = String::new();
    file.read_to_string(&mut contents).unwrap();

    let charvec: Vec<char> = contents.chars().collect();

    let mut names:std::vec::Vec<String> = Vec::new();
    let mut start = 1;

    for i in 0 .. charvec.len() - 3 {
        if charvec[i] == '"' {
            if charvec[i+1] == ',' {
                if charvec[i+2] == '"' {
                    let name:String = charvec[start .. i].into_iter().collect();
                    names.push(name);
                    start = i + 3;
                }
            }
        }
    }
    let name:String = charvec[start .. charvec.len() - 1].into_iter().collect();
    names.push(name);
    names.sort();

    let mut total:usize = 0;
    for (i, name) in names.iter().enumerate() {
        let mut letters:usize = 0;
        for j in name.chars() {
            letters = letters + (j as usize - 64);
        }
        total = total + ((i + 1) * letters);
    }
    total
}

fn main() {
    println!("{}", pe021())
}
