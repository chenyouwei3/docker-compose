package main

import (
	"fmt"
	"github.com/go-redis/redis"
	"log"
)

var rdb *redis.ClusterClient

// 初始化 Redis 集群客户端
func initRedisCluster() {
	rdb = redis.NewClusterClient(&redis.ClusterOptions{
		Addrs: []string{
			"106.12.19.43:6379",
			"106.12.19.43:6380",
			"106.12.19.43:6381",
			"106.12.19.43:6382",
			"106.12.19.43:6383",
			"106.12.19.43:6384",
		}, // 替换为你的集群节点地址
	})
	// 测试连接
	rs, err := rdb.Ping().Result()
	if err != nil {
		log.Fatalf("无法连接到 Redis 集群: %v", err)
	}
	fmt.Println("成功连接到 Redis 集群!", rs)
}

func main() {
	// 初始化 Redis 集群连接
	initRedisCluster()
}
