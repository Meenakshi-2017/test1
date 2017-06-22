#!/bin/bash

apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
#apt-get install -y --allow-unauthenticated docker-engine 

#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu trusty stable"
sudo apt-get update
sudo apt-get install -y docker-ce --force-yes
#DNS IP address configuration
echo "nameserver "8.8.8.8 >> /etc/resolvconf/resolv.conf.d/head
resolvconf -u
echo "Downloading Docker Image and Run"
sudo docker login -u meenakshi2017 -p ril123
docker pull meenakshi2017/server 
docker run  -p 8086:8086 -it meenakshi2017/server
