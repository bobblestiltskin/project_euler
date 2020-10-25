package main

import (
	"fmt"
	"math"
)

func sum_factors(num int) int {
	total := 1
	for i := 2; i < int(math.Sqrt(float64(num))); i++ {
		if num%i == 0 {
			total += (i + num/i)
		}
	}
	return total
}

func main() {
	const SIZE = 10000
	spd := make([]int, 0, SIZE)
	for i := 0; i < SIZE; i++ {
		spd = append(spd, sum_factors(i))
	}

	var result int
	for i := 0; i < SIZE; i++ {
		if spd[i] < SIZE {
			if i != spd[i] {
				if spd[spd[i]] == i {
					result += i
				}
			}
		}
	}
	fmt.Printf("%d\n", result)
}
