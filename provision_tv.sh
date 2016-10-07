#!/bin/bash
echo "Starting provisioning of TV node..."

# support for multiple monitors in VM
sudo apt-get install virtualbox-guest-x11 -y

# useful tools
sudo apt-get install netdiag -y
sudo apt-get install tcpdump -y
