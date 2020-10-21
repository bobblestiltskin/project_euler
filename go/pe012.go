package main

import (
	"fmt"
	"math"
)

const SIZE = 26

func get_num_divisors(num int) int {
	var counter int
	running := 1
	root := int(math.Sqrt(float64(num)))

	for running <= root {
		if num%running == 0 {
			counter++
		}
		running++
	}

	return counter
}

func main() {
	const LAST = 250
	var num, i int
	j := 1
	for num < LAST {
		i = i + j
		num = get_num_divisors(i)
		j++
	}
	fmt.Printf("%d\n", i)
}
