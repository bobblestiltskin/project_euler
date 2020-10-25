package main

import (
	"fmt"
)

const ROWS = 15

func main() {
	cycle := []int{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
		31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
		31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
		31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

	var count int
	dow := 2 // start on tuesday 1901.1.1
	// 2000 is a leap year too!
	for i := 0; i < 25; i++ {
		for j := 0; j < len(cycle); j++ {
			if dow == 0 {
				count += 1
			}
			dow = (dow + cycle[j]) % 7
		}
	}
	fmt.Printf("%d\n", count)
}
