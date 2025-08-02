#!/bin/bash
set -e # Exit on any error

install_kind() {
    echo "Installing Kind..."
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
}

install_kubectl() {
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
}

# Main execution
echo "Updating packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install docker.io -y

echo "Configuring docker..."
sudo usermod -aG docker $USER
# Effective group change requires logout/login, but we'll proceed

install_kind
install_kubectl

echo -e "\nInstallation complete!"
echo "Kind version: $(kind version)"
echo "kubectl version: $(kubectl version --client)"
