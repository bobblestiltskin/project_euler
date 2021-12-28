package main

import (
	"fmt"
)

func next_term(num uint64) uint64 {
	var retval uint64
	if num%2 == 0 {
		retval = num / 2
	} else {
		retval = num + num + num + 1
	}
	return retval
}

func main() {
	const LAST uint64 = 1000000
	const HLAST uint64 = 500000
	var maxi, max uint64
	for i := HLAST; i < LAST; i++ {
		var counter uint64
		var j uint64
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
