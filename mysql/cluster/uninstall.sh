# 停止所有 MySQL 相关的容器
sudo docker container stop mysql-server-1 mysql-server-2 mysql-server-3 mysql-router

# 删除所有 MySQL 相关的容器
sudo docker container rm mysql-server-1 mysql-server-2 mysql-server-3 mysql-router
# 删除数据目录
sudo rm -rf data/



