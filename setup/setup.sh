#!/bin/bash

# Install Java 1.8
sudo apt update
sudo apt install -y openjdk-8-jdk
java -version

# Install Docker and Docker Compose  
#Download the Docker GPG Key
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Add the Docker Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#Update and Install Docker
sudo apt update
sudo apt install -y docker-ce
# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# Install Development Tools and dependencies
# Install libxcrypt-compat
sudo apt install -y libxcrypt-compat

# Install development tools (build-essential)
sudo apt update
sudo apt install -y build-essential

# Install development dependencies for openssl, bzip2, and libffi
sudo apt install -y libssl-dev libbz2-dev libffi-dev


# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to docker group
sudo usermod -aG docker $USER
newgrp docker

# Download and install Python 3.11.9
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz
sudo tar xzf Python-3.11.9.tgz
cd Python-3.11.9
sudo ./configure --enable-optimizations
sudo make altinstall

# Verify Python installation
python3.11 --version
