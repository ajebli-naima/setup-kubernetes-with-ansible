cd certs

sudo cat > ca-config.json <<EOF
{
    "signing": {
        "default": {
            "expiry": "8760h"
        },
        "profiles": {
            "etcd": {
                "expiry": "8760h",
                "usages": ["signing","key encipherment","server auth","client auth"]
            }
        }
    }
}
EOF

sudo cat > ca-csr.json <<EOF
{
  "CN": "etcd cluster",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "FR",
      "L": "France",
      "O": "Leyton",
      "OU": "etcd-ca",
      "ST": "Paris"
    }
  ]
}
EOF

sudo cfssl gencert -initca ca-csr.json | cfssljson -bare ca

