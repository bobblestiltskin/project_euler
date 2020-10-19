package main

import (
	"fmt"
)

func main() {
	max := 1000
	var total int
	for i := 0; i < max; i++ {
		if (i%3 == 0) || (i%5 == 0) {
			total += i
		}
	}
	fmt.Printf("%d\n", total)
}
