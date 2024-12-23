#!/bin/bash

# 容器名称列表
containers=("redis-1" "redis-2" "redis-3" "redis-4" "redis-5" "redis-6")
# 配置文件路径列表
config_files=("./conf/redis-1.conf" "./conf/redis-2.conf" "./conf/redis-3.conf" "./conf/redis-4.conf" "./conf/redis-5.conf" "./conf/redis-6.conf")

# 遍历容器
for i in ${!containers[@]}; do
  # 获取容器的 IP 地址
  ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${containers[$i]})

  if [ -z "$ip" ]; then
    echo "Error: Failed to get IP address for container ${containers[$i]}"
    continue
  fi

  echo "Updating ${containers[$i]} with IP address: $ip"

  # 检查配置文件是否包含 cluster-announce-ip 行
  grep "cluster-announce-ip" ${config_files[$i]}

  if [ $? -eq 0 ]; then
    # 修改配置文件中的 cluster-announce-ip 参数
    sed -i "s/^cluster-announce-ip .*/cluster-announce-ip $ip/" ${config_files[$i]}
    echo "Updated cluster-announce-ip for ${containers[$i]} to $ip"
  else
    echo "Error: No cluster-announce-ip found in ${config_files[$i]}"
  fi

  if [ $? -eq 0 ]; then
    echo "${containers[$i]} configuration updated successfully."
  else
    echo "Failed to update ${containers[$i]} configuration."
  fi
done

echo "All containers' configurations have been updated."

docker container restart redis-1 redis-2 redis-3 redis-4 redis-5 redis-6