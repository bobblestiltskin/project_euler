package main

import (
	"fmt"
	"math"
)

func is_prime(test int, primes []int) bool {
	root := int(math.Sqrt(float64(test)))
	for i := 0; i < len(primes); i++ {
		if primes[i] > root {
			return true
		}
		if test%primes[i] == 0 {
			return false
		}
	}
	return false
}

func main() {
	primenum := 10001
	primes := []int{2, 3}

	var test int
	test = primes[len(primes)-1] + 2
	for len(primes) < primenum {
		if is_prime(test, primes) {
			primes = append(primes, test)
		}
		test += 2
	}
	fmt.Printf("%d\n", primes[len(primes)-1])
}
