package main

import (
	"fmt"
)

func main() {
	// need to compute 2n!/((n!)*(n!))

	const MAX = 20
	numerator := make([]int, 0, MAX)
	denominator := make([]int, 0, MAX)
	for i := 0; i < MAX; i++ {
		denominator = append(denominator, i+1)
		numerator = append(numerator, i+MAX+1)
	}

	//  walk through lists and cast away multiples to reduce size of numbers from factorials

	for i := 0; i < MAX; i++ {
		for j := 0; j < MAX; j++ {
			if denominator[i] != 1 && numerator[j]%denominator[i] == 0 {
				numerator[j] /= denominator[i]
				denominator[i] = 1
			}
		}
	}

	num := 1
	denom := 1
	for i := 0; i < MAX; i++ {
		num *= numerator[i]
		denom *= denominator[i]
	}

	fmt.Printf("%d\n", num/denom)
}
