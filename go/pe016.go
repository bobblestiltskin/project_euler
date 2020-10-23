package main

import (
	"fmt"
	"math/big"
)

func main() {
	const POWER = 1000
	base := big.NewInt(2)
	num := big.NewInt(2)

	i := 1
	for i < POWER {
		num.Mul(num, base)
		i += 1
	}

	tmp_string := fmt.Sprintf("%d", num)
	var ssum int
	for i := 0; i < len(tmp_string); i++ {
		ssum += int(tmp_string[i]) - 48
	}
	fmt.Printf("%d\n", ssum)
}
