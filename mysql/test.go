package main

import (
	"database/sql"
	"fmt"
	"log"
	_const "workShell/const"

	_ "github.com/go-sql-driver/mysql"
)

func main() {
	// MySQL 连接配置
	// 使用 MySQL Router 的端口 6446
	// 根据您的配置，用户名和密码为 root/root 或 sangang/sangang
	// 这里以 root 用户为例

	// DSN 格式: username:password@tcp(host:port)/dbname?param=value
	// 如果不指定 dbname，可以使用空字符串 ""
	dsn := "root:root@tcp(" + _const.Server_ip + ":6446)/"
	// 打开数据库连接
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		log.Fatalf("无法打开数据库连接: %v", err)
	}
	defer db.Close()
	// 测试数据库连接
	err = db.Ping()
	if err != nil {
		log.Fatalf("无法连接到数据库: %v", err)
	}
	fmt.Println("成功连接到 MySQL 数据库!")
	// 可选：执行简单的查询
	// 例如，列出当前数据库中的所有数据库
	rows, err := db.Query("SHOW DATABASES;")
	if err != nil {
		log.Fatalf("查询失败: %v", err)
	}
	defer rows.Close()

	fmt.Println("数据库列表:")
	for rows.Next() {
		var dbName string
		if err := rows.Scan(&dbName); err != nil {
			log.Fatalf("读取数据失败: %v", err)
		}
		fmt.Println(" -", dbName)
	}

	// 检查迭代过程中是否有错误
	if err = rows.Err(); err != nil {
		log.Fatalf("行迭代错误: %v", err)
	}
}
