#! /bin/bash

# basic preparation of vm images

sed -i 's/us.archive.ubuntu.com/ch.archive.ubuntu.com/g' /etc/apt/sources.list
# 
apt-get update
apt-get install -y ubuntu-cloud-keyring python-software-properties software-properties-common python-keyring
echo deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/grizzly main > /etc/apt/sources.list.d/grizzly.list

export DEBIAN_FRONTEND=noninteractive
# 
apt-get update -y
apt-get install ntp -y
apt-get upgrade -y
#
cat >> /etc/hosts <<EOF
10.0.10.10  controller  
10.0.10.11  netnode  
10.0.10.12  compute1
EOF

apt-get install -y linux-headers-3.2.0-23-generic vim
apt-get install -y mysql-server python-mysqldb rabbitmq-server 
apt-get install -y keystone 
apt-get install -y glance 
apt-get install -y cinder-api cinder-scheduler cinder-volume
apt-get install -y iscsitarget open-iscsi iscsitarget-dkms python-cinderclient
apt-get install -y nova-api nova-cert novnc nova-consoleauth nova-scheduler nova-novncproxy nova-doc nova-conductor
apt-get install -y openstack-dashboard
