docker compose up -d
docker exec -it redis-1 redis-cli --cluster create \
  127.0.0.1:6379 \
  127.0.0.1:6380 \
  127.0.0.1:6381 \
  127.0.0.1:6382 \
  127.0.0.1:6383 \
  127.0.0.1:6384 \
  --cluster-replicas 1
