package main

import (
	"fmt"
)

func is_prime(num int) bool {
	if num%2 == 1 {
		if num < 8 {
			return num != 1
		} else {
			var divisor int
			divisor = 3
			for divisor*divisor <= num {
				if num%divisor == 0 {
					return false
				}
				divisor += 2
			}
			return true
		}
	} else {
		return num == 2
	}
}

func main() {
	max := 20
	var i, total int
	var try_product bool

	i = 2
	total = 1
	try_product = true
	for i < max {
		if is_prime(i) {
			if try_product {
				if i*i > max {
					try_product = false
				} else {
					var tmp, last int
					tmp = i
					last = tmp
					for tmp < max {
						last = tmp
						tmp *= i
					}
					total *= last
				}
			}
			if !try_product {
				total *= i
			}
		}
		i += 1
	}
	fmt.Printf("%d\n", total)
}
