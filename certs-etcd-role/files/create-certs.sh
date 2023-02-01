cd certs

ETCD_1_IP="<ETCD_1_IP>"
ETCD_2_IP="<ETCD_2_IP>"
ETCD_3_IP="<ETCD_3_IP>"

sudo cat > etcd-csr.json <<EOF
{
  "CN": "etcd",
  "hosts": [
    "localhost",
    "127.0.0.1",
    "${ETCD_1_IP}",
    "${ETCD_2_IP}",
    "${ETCD_3_IP}"
    
  ],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "FR",
      "L": "France",
      "O": "Leyton",
      "OU": "etcd",
      "ST": "Paris"
    }
  ]
}
EOF

cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=etcd etcd-csr.json | cfssljson -bare etcd