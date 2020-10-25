package main

import (
	"fmt"
	"math/big"
)

func main() {
	const LAST = 100
	num := big.NewInt(1)

	var i int64
	i = 1
	for i < LAST {
		num.Mul(num, big.NewInt(i))
		i += 1
	}

	tmp_string := fmt.Sprintf("%d", num)
	var ssum int
	for i := 0; i < len(tmp_string); i++ {
		ssum += int(tmp_string[i]) - 48
	}
	fmt.Printf("%d\n", ssum)
}
