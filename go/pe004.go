package main

import (
	"fmt"
)

func is_palindromic(digits string) bool {
	dlen := len(digits)
	for i := 0; i < dlen; i++ {
		if digits[i] != digits[dlen-(i+1)] {
			return false
		}
	}
	return true
}

func main() {
	const MIN3 = 100
	const MAX3 = 999

	var mini, minj, maxj, maxp, product int

	mini = MIN3
	minj = MIN3
	maxj = MAX3
	maxp = 0
	for i := MAX3; i >= mini; i-- {
		for j := maxj; j >= minj; j-- {
			product = i * j
			digits := fmt.Sprintf("%d", product)
			if is_palindromic(digits) {
				if product > maxp {
					maxp = product
					minj = product / 1000
					mini = minj
				}
			}
		}
	}
	fmt.Printf("%d\n", maxp)
}
