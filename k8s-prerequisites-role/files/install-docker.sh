if [ which docker && docker --version ]; then
  echo "Docker is already installed"
else
  echo "Install docker"
  sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
  sudo apt update
  apt-cache policy docker-ce
  sudo apt -y install docker-ce docker-ce-cli containerd.io
  # sudo apt-get install -y ca-certificates curl gnupg  lsb-release
  # sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg
  # curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  # sudo apt update
  # sudo apt-get install -y docker-ce docker-ce-cli containerd.io

fi