package main

import (
	"fmt"
	"math"
)

func sum_factors(num int) int {
	asum := 1
	for i := 2; i <= int(math.Sqrt(float64(num))); i++ {
		if num%i == 0 {
			divisor := num / i
			asum += i
			if i != divisor {
				asum += divisor
			}
		}
	}
	return asum
}

func main() {
	const MAX = 28123
	abundant := []int{}
	amap := make(map[int]int)
	for i := 1; i < MAX; i++ {
		fsum := sum_factors(i)
		if i < fsum {
			abundant = append(abundant, i)
			amap[i] = fsum
		}
	}

	var asum int
	for i := 0; i < abundant[0]; i++ {
		asum += i
	}
	var addi bool
	for i := abundant[0]; i < MAX; i++ {
		addi = true
		for _, j := range abundant {
			if j < i {
				diff := i - j
				if _, ok := amap[diff]; ok {
					addi = false
					break
				}
			}
		}
		if addi {
			asum += i
		}
	}
	fmt.Printf("%d\n", asum)
}
