# 清理并创建目录
rm -rf /tmp/etcd/single/data
mkdir -p /tmp/etcd/single/data
mkdir -p /tmp/etcd/single/conf

# 指定 etcd.yml 文件路径
ETCD_YML_PATH="/tmp/etcd/single/conf/etcd.yml"

# 使用 echo 命令逐行写入配置内容到文件
echo "name: s1" > $ETCD_YML_PATH
echo "data-dir: /etcd-data" >> $ETCD_YML_PATH
echo "listen-client-urls: http://0.0.0.0:2379" >> $ETCD_YML_PATH
echo "advertise-client-urls: http://0.0.0.0:2379" >> $ETCD_YML_PATH
echo "listen-peer-urls: http://0.0.0.0:2380" >> $ETCD_YML_PATH
echo "initial-advertise-peer-urls: http://0.0.0.0:2380" >> $ETCD_YML_PATH
echo "initial-cluster: s1=http://0.0.0.0:2380" >> $ETCD_YML_PATH
echo "initial-cluster-token: etcd-cluster-token" >> $ETCD_YML_PATH
echo "initial-cluster-state: new" >> $ETCD_YML_PATH
echo "log-level: info" >> $ETCD_YML_PATH
echo "logger: zap" >> $ETCD_YML_PATH
echo "log-outputs: stderr" >> $ETCD_YML_PATH

# 提示操作完成
echo "etcd.yml 文件已更新和保存"

docker pull gcr.io/etcd-development/etcd:v3.4.25