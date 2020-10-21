package main

import (
	"fmt"
)

func next_term(num int) int {
	var retval int
	if num%2 == 0 {
		retval = num / 2
	} else {
		retval = num + num + num + 1
	}
	return retval
}

func main() {
	const LAST = 1000000
	const HLAST = 500000
	var maxi, max int
	for i := HLAST; i < LAST; i++ {
		var counter, j int
		j = i
		for j != 1 {
			j = next_term(j)
			counter++
		}
		counter++

		if counter > max {
			max = counter
			maxi = i
		}
	}
	fmt.Printf("%d\n", maxi)
}
