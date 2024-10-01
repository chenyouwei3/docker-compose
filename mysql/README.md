# 使用说明

## 单机部署

### 配置文件说明

按需求自定义配置文件更改

## 集群部署
该配置为三节点的innodb cluster 主从复制
### 组件说明
- 1.MySQL Shell 是Oracle官方提供的一个交互式工具，用于开发和管理MySQL的服务器。支持JavaScript、SQL、Python...不，是木兰接口。 可使用它来执行数据查询、更新以及各种管理操作
- 2.MySQL Router 是MySQL官方提供的一个轻量级中间件，是InnoDB Cluster的一部分，可在应用程序和后端MySQL服务器之间提供透明路由。主要用以解决MySQL主从库集群的高可用、负载均衡、易扩展等问题。Router作为一个流量转发层，位于应用与MySQL服务器之间，其功能类似于LVS。
- 3.MySQL Server 是Mysql实例
### 配置文件说明 

- mysql-router.env 配置MySQL Router,使其能够连接到Mysql集群并转发请求
>MYSQL_USER=root // 用于 MySQL Router 连接 MySQL 集群的用户名  
>MYSQL_HOST=mysql-server-1 // MySQL 集群中主节点的主机名或服务名  
>MYSQL_PORT=3306 // 主节点的 MySQL 端口号  
>MYSQL_PASSWORD=root // 用于连接的用户密码  
>MYSQL_INNODB_NUM_MEMBERS=3 // InnoDB Cluster 中的成员数量  

- mysql-server.env 配置MySQL 服务器的基本环节,特别是root用户的访问权限和密码
>MYSQL_ROOT_PASSWORD=root // 设置 MySQL root 用户的密码为 'root'  
>MYSQL_ROOT_HOST=% // 允许 root 用户从任何主机连接（% 代表任意主机）  

- mysql-shell.env 配置MySQL Shell 的连接信息以及要执行的初始化脚本,一边设置集群或初始化数据库
>MYSQL_USER=root // 用于 MySQL Shell 连接 MySQL 集群的用户名  
>MYSQL_HOST=mysql-server-1 // MySQL 集群中主节点的主机名或服务名  
>MYSQL_PORT=3306 // 主节点的 MySQL 端口号  
>MYSQL_PASSWORD=root // 用于连接的用户密码  
>MYSQLSH_SCRIPT=/scripts/setupCluster.js // MySQL Shell 要执行的集群设置脚本路径  
>MYSQL_SCRIPT=/scripts/db.sql // MySQL Shell 要执行的数据库初始化脚本路径  

