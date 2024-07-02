package main

import (
	"context"
	"fmt"
	"log"
	"time"

	clientv3 "go.etcd.io/etcd/client/v3"
)

func main() {
	// 配置etcd客户端
	cli, err := clientv3.New(clientv3.Config{
		Endpoints:   []string{"62.234.32.141:2379"}, // 请替换为你的etcd集群地址
		DialTimeout: 5 * time.Second,
	})
	if err != nil {
		log.Fatal("连接etcd失败:", err)
	}
	defer cli.Close()

	// 设定一个键值对以检查连接
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()

	// 检查连接是否成功
	_, err = cli.Status(ctx, cli.Endpoints()[0])
	if err != nil {
		log.Fatal("连接etcd失败:", err)
	} else {
		fmt.Println("连接etcd成功")
	}
}
