package main

import (
	"fmt"
)

func main() {
	var sumsq int
	sumsq = 0
	for i := 0; i < 100; i++ {
		sumsq += (i + 1) * (i + 1)
	}
	sqsum := (101 * 50) * (101 * 50)
	fmt.Printf("%d\n", sqsum-sumsq)
}
