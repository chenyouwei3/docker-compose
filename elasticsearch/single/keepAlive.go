package main

import (
	"fmt"
	"github.com/olivere/elastic/v7"
)

// Elasticsearch demo

type Person struct {
	Name    string `json:"name"`
	Age     int    `json:"age"`
	Married bool   `json:"married"`
}

var client *elastic.Client

func main() {
	var err error
	client, err = elastic.NewClient(elastic.SetURL("http://62.234.32.141:9200"), elastic.SetSniff(false))
	if err != nil {
		// Handle error
		panic(err)
	}
	fmt.Println("connect to es success")

}
