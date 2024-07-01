#!/bin/bash

# 拉取Redis镜像
docker pull redis:6.0.20

# 创建必要的目录结构
mkdir -p /home/docker/redis6/{conf,data}

# 直接写入配置内容到文件，这里使用转义的Here Document避免shell对内容进行变量展开
cat <<-'EOF' > /home/docker/redis6/conf/redis.conf
# 关闭保护模式，允许远程连接
protected-mode no
# 开启AOF持久化
appendonly yes
# 密码
requirepass 123456
EOF

# 确认操作
echo "Redis配置文件已创建并写入 /home/docker/redis6/conf/redis.conf"