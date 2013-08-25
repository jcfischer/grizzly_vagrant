#! /bin/bash

# basic preparation of vm images

sed -i 's/us.archive.ubuntu.com/ch.archive.ubuntu.com/g' /etc/apt/sources.list
# 
apt-get update
apt-get install -y ubuntu-cloud-keyring python-software-properties software-properties-common python-keyring
echo deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/grizzly main > /etc/apt/sources.list.d/grizzly.list
# 
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install ntp -y
apt-get upgrade -y
#
cat >> /etc/hosts <<EOF
10.0.10.10  controller  
10.0.10.11  netnode  
10.0.10.12  compute1
EOF

apt-get install -y python-mysqldb 
apt-get install -y nova-network ebtables nova-api-metadata 

