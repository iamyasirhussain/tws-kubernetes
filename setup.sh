#!/bin/bash
# installing kind
sudo apt update
sleep 3
sudo apt upgrade -y
sleep 3
sudo apt update
sleep 3
sudo apt install docker.io -y
sleep 3
sudo usermod -aG docker $USER
sleep 3
newgrp docker
sleep 3
sudo curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
sleep 3
sudo chmod +x ./kind
sleep 3
sudo mv ./kind /usr/local/bin/kind
# installing kubectl
sleep 3
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sleep 3
sudo chmod +x ./kubectl
sleep 3
sudo mv ./kubectl /usr/local/bin/kubectl
