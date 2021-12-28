package main

import (
	"fmt"
)

func main() {
	var number uint64 = 600851475143
	var i uint64 = 3
	var max_prime uint64
	for number != 1 {
		if number%i == 0 {
			max_prime = i
			number = number / i
		} else {
			i = i + 2
		}
	}
	fmt.Printf("%d\n", max_prime)
}
