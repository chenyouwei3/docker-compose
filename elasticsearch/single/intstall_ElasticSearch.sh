docker network create es-net

docker pull elasticsearch:7.12.1

docker pull kibana:7.12.1
docker run -d \
  --name es \
    -e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
    -e "discovery.type=single-node" \
    -v es-data:/usr/local/elasticsearch7.12.1/data \
    -v es-plugins:/usr/local/elasticsearch7.12.1/plugins \
    -v es-logs:/usr/local/elasticsearch7.12.1/logs \
    --privileged \
    --network es-net \
    -p 9200:9200 \
    -p 9300:9300 \
elasticsearch:7.12.1


