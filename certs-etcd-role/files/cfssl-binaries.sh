mkdir certs
wget -q --show-progress \
    https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssl \
    https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssljson
  
sudo chmod +x cfssl cfssljson
sudo mv cfssl cfssljson /usr/local/bin/