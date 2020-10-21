package main

import (
	"fmt"
)

func main() {
	number := 600851475143
	var max_prime int
	i := 3
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
