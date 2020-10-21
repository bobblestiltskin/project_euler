package main

import (
	"fmt"
)

func main() {
	const MAX = 4000000
	var next, total int
	previous := 1
	current := 1
	for current < MAX {
		next = current + previous
		if current%2 == 0 {
			total += current
		}
		previous = current
		current = next
	}
	fmt.Printf("%d\n", total)
}
