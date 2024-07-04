docker exec -it es bash

cd /usr/share/elasticsearch/bin

./elasticsearch-plugin  install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.12.1/elasticsearch-analysis-ik-7.12.1.zip

exit

docker restart es


