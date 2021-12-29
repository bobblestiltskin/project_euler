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
	const LAST = 2000000
	primes := []int{2}

	var sum uint64
	sum = 2
	for i := 3; i < LAST; i = i + 2 {
		if is_prime(i, primes) {
			primes = append(primes, i)
			sum += uint64(i)
		}
	}
	fmt.Printf("%d\n", sum)
}
