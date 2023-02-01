sudo cat <<EOF >/etc/haproxy/haproxy.cfg
frontend kube-apiserver
  bind *:6443
  mode tcp
  option tcplog
  default_backend kube-apiserver

backend kube-apiserver
    mode tcp
    option tcplog
    option tcp-check
    balance roundrobin
    default-server inter 10s downinter 5s rise 2 fall 2 slowstart 60s maxconn 250 maxqueue 256 weight 100
    server k8s-master-1 {{ MASTER_1_IP }}:6443 check
    server k8s-master-2 {{ MASTER_2_IP }}:6443 check
EOF
