#!/bin/sh
apt-get update
apt-get install -y sudo vim gedit locales gnupg2 wget curl zip lsb-release bash-completion
apt-get install -y net-tools iputils-ping mesa-utils software-properties-common build-essential
apt-get install -y python3 python3-pip python3-numpy
apt-get install -y openssh-server openssl git git-lfs tmux

# Add Docker APT repository
. /etc/os-release
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
if [ "$VERSION_ID" = "24.04" ]; then
    echo "Types: deb\n\
Architectures: $(dpkg --print-architecture)\n\
Signed-By: /etc/apt/keyrings/docker.asc\n\
URIs: https://download.docker.com/linux/ubuntu\n\
Suites: $VERSION_CODENAME\n\
Components: stable" > /etc/apt/sources.list.d/docker.sources
else
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $VERSION_CODENAME stable" > /etc/apt/sources.list.d/docker.list
fi
apt-get update
apt-get install -y docker-ce-cli docker-compose-plugin
