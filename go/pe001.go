package main

import (
	"fmt"
)

func main() {
	const MAX = 1000
	var total int
	for i := 0; i < MAX; i++ {
		if (i%3 == 0) || (i%5 == 0) {
			total += i
		}
	}
	fmt.Printf("%d\n", total)
}
