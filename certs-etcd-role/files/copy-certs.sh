NODES=(<ETCD1_IP> <ETCD2_IP> <ETCD3_IP>)

for node in ${NODES[@]}; do
  scp certs/ca.pem certs/etcd.pem certs/etcd-key.pem jenkins@$node:
done
