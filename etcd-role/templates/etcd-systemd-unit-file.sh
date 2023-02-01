export NODE_IP="{{ ETCD_IP_ADDRESS }}"

export ETCD_NAME="{{ ETCD_NAME }}"

export ETCD_1_NAME="{{ ETCD_1_NAME }}"
export ETCD_2_NAME="{{ ETCD_2_NAME }}"
export ETCD_3_NAME="{{ ETCD_3_NAME }}"

export ETCD_1_IP="{{ ETCD_1_IP }}"
export ETCD_2_IP="{{ ETCD_2_IP }}"
export ETCD_3_IP="{{ ETCD_3_IP }}"


cat <<EOF >/etc/systemd/system/etcd.service
[Unit]
Description=etcd

[Service]
Type=notify
ExecStart=/usr/local/bin/etcd \\
  --name ${ETCD_NAME} \\
  --cert-file=/etc/etcd/pki/etcd.pem \\
  --key-file=/etc/etcd/pki/etcd-key.pem \\
  --peer-cert-file=/etc/etcd/pki/etcd.pem \\
  --peer-key-file=/etc/etcd/pki/etcd-key.pem \\
  --trusted-ca-file=/etc/etcd/pki/ca.pem \\
  --peer-trusted-ca-file=/etc/etcd/pki/ca.pem \\
  --peer-client-cert-auth \\
  --client-cert-auth \\
  --initial-advertise-peer-urls https://${NODE_IP}:2380 \\
  --listen-peer-urls https://${NODE_IP}:2380 \\
  --advertise-client-urls https://${NODE_IP}:2379 \\
  --listen-client-urls https://${NODE_IP}:2379,https://127.0.0.1:2379 \\
  --initial-cluster-token etcd-cluster \\
  --initial-cluster ${ETCD_1_NAME}=https://${ETCD_1_IP}:2380,${ETCD_2_NAME}=https://${ETCD_2_IP}:2380,${ETCD_3_NAME}=https://${ETCD_3_IP}:2380 \\
  --initial-cluster-state new
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
