package main

// 9! is 362880 so after all the 10 digit numbers which
// start with 0 or 1 we will have passed 725760 of the
// combinations. The millionth combination will start
// with a 2, since we need to count 274240 more combinations
// after 2000000000.

// 8! is 40320, so there are that many 10 digit combinations starting 20.
// The combination starting 22 is invalid (since the numerals must be
// distinct), so we could count 6 sets of combinations of 40320 up to
// 2700000000 and then we would have seen 725760+241920 leaving 32320 to
// find.

// 7! is 5040, so 6 sets are 30240. As before we count 6 sets from
// 2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

import (
	"fmt"
	"strings"
)

func main() {
	const START = 2780000000
	const END = 9876543210
	const MAXNUM = 1000000

	count := 725760 + 241920 + 30240
	num := START - 1

	for num < END {
		num = num + 1
		digits := fmt.Sprintf("%d", num)
		if strings.Contains(digits, "0") &&
			strings.Contains(digits, "1") &&
			strings.Contains(digits, "2") &&
			strings.Contains(digits, "3") &&
			strings.Contains(digits, "4") &&
			strings.Contains(digits, "5") &&
			strings.Contains(digits, "6") &&
			strings.Contains(digits, "7") &&
			strings.Contains(digits, "8") &&
			strings.Contains(digits, "9") {
			count++
			if count == MAXNUM {
				break
			}
		}
	}
	fmt.Printf("%d\n", num)
}
