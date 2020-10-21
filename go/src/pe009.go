package main

import (
	"fmt"
)

func main() {
	const STOP = 1000
	for a := 0; a < STOP; a++ {
		for b := a + 1; b < STOP; b++ {
			for c := b + 1; c < STOP; c++ {
				if a+b+c == STOP {
					if a*a+b*b == c*c {
						fmt.Printf("%d\n", a*b*c)
						return
					}
				}
			}
		}
	}
}
