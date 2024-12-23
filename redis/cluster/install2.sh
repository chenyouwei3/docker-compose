docker exec -it redis-1 redis-cli --cluster create \
  172.18.0.5:6379 \
  172.18.0.3:6380 \
  172.18.0.2:6381 \
  172.18.0.7:6382 \
  172.18.0.4:6383 \
  172.18.0.6:6384 \
  --cluster-replicas 1 \
  --cluster-yes
