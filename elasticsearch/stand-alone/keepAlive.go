package main

import (
	"fmt"
	"github.com/olivere/elastic/v7"
)

func main() {
	Init()
}

var client *elastic.Client

func Init() {
	urlOpt := elastic.SetURL("http://62.234.32.141:9200")
	sniffOpt := elastic.SetSniff(false)

	var err error
	client, err = elastic.NewClient(urlOpt, sniffOpt)
	if err != nil {
		// Handle error
		panic(err)
	}
	fmt.Println("connect to es success")
}
