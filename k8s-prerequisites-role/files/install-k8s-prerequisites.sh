sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> ~/kubernetes.list
sudo mv ~/kubernetes.list /etc/apt/sources.list.d
sudo apt update
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
sudo swapoff -a
sudo sysctl net.bridge.bridge-nf-call-iptables=1
