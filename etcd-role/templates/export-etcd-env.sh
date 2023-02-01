export ETCD_1_IP="{{ ETCD_1_IP }}"
export ETCD_2_IP="{{ ETCD_2_IP }}"
export ETCD_3_IP="{{ ETCD_3_IP }}"



export ETCDCTL_API=3 
export ETCDCTL_ENDPOINTS=https://${ETCD_1_IP}:2379,https://${ETCD_2_IP}:2379
export ETCDCTL_CACERT=/etc/etcd/pki/ca.pem
export ETCDCTL_CERT=/etc/etcd/pki/etcd.pem
export ETCDCTL_KEY=/etc/etcd/pki/etcd-key.pem