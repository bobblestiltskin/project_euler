package main

import (
	"fmt"
	"io/ioutil"
	"sort"
)

func main() {
	path := "../names.txt"
	data, err := ioutil.ReadFile(path)
	if err != nil {
		fmt.Println("File reading error", err)
		return
	}

	//	names := make([]string,len(data))
	names := []string{}
	start := 1
	for i := 0; i < len(data)-3; i++ {
		if data[i] == '"' {
			if data[i+1] == ',' {
				if data[i+2] == '"' {
					name := string(data[start:i])
					names = append(names, name)
					start = i + 3
				}
			}
		}
	}
	name := string(data[start : len(data)-1])
	names = append(names, name)
	sort.Strings(names)

	var ssum int
	for i := 0; i < len(names); i++ {
		var letters int
		for j := 0; j < len(names[i]); j++ {
			letters += int(names[i][j]) - 64
		}
		ssum += letters * (i + 1)
	}
	fmt.Printf("%d\n", ssum)
}
