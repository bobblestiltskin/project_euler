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
	min3 := 100
	max3 := 999

	var mini, minj, maxj, maxp, product int

	mini = min3
	minj = min3
	maxj = max3
	maxp = 0
	for i := max3; i >= mini; i-- {
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
