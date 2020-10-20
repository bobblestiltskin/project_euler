package main

import (
	"fmt"
)

func main() {
	stop := 1000
	for a := 0; a < stop; a++ {
		for b := a + 1; b < stop; b++ {
			for c := b + 1; c < stop; c++ {
				if a+b+c == stop {
					if a*a+b*b == c*c {
						fmt.Printf("%d\n", a*b*c)
						return
					}
				}
			}
		}
	}
}
