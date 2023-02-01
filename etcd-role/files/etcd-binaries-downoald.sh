ETCD_VER=v3.5.1
wget -q --show-progress "https://github.com/etcd-io/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz"
tar zxf etcd-v3.5.1-linux-amd64.tar.gz
sudo mv etcd-v3.5.1-linux-amd64/etcd* /usr/local/bin/
sudo rm -rf etcd*
