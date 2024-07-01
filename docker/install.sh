#!/bin/bash

# 检查是否已安装Docker，如果未安装则安装
if [[ ! `which docker` ]];then
    curl https://get.docker.com | bash
fi

# 使用Docker Compose拉取镜像、运行数据库迁移、启动服务、清理未使用的镜像，并重启服务
docker compose pull && \
docker compose run --rm api npx prisma db push && \
docker compose up -d && \
docker image prune -f && \
docker compose restart



