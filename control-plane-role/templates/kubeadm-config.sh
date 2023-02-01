export ETCD_1_IP="{{ ETCD_1_IP }}"
export ETCD_2_IP="{{ ETCD_2_IP }}"
export ETCD_3_IP="{{ ETCD_3_IP }}"

cat <<EOF > {{HOME}}/kubeadm-config.yaml
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
kubernetesVersion: stable
controlPlaneEndpoint: "<VIRTUAL_IP>:6443"
etcd:
    external:
        endpoints:
        - https://${ETCD_1_IP}:2379
        - https://${ETCD_2_IP}:2379
        - https://${ETCD_3_IP}:2379
        caFile: /etc/kubernetes/pki/etcd/ca.pem
        certFile: /etc/kubernetes/pki/etcd/etcd.pem
        keyFile: /etc/kubernetes/pki/etcd/etcd-key.pem
EOF