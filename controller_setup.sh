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
10.0.0.3  db-node
10.0.0.3  auth-node
10.0.0.3  image-node
10.0.0.3  api-node
10.0.0.3  volume-node
10.0.0.7  network-node
10.0.0.20  compute1
10.0.0.21  compute2

172.16.0.3 db-node.example.org
172.16.0.3 auth-node.example.org
172.16.0.3 image-node.example.org
172.16.0.3 api-node.example.org
172.16.0.3 volume-node.example.org
172.16.0.7 network-node.example.org

EOF

apt-get install -y linux-headers-3.2.0-23-generic vim
apt-get install -y mysql-server python-mysqldb rabbitmq-server
apt-get install -y keystone
apt-get install -y glance
apt-get install -y cinder-api cinder-scheduler cinder-volume
apt-get install -y iscsitarget open-iscsi iscsitarget-dkms python-cinderclient
apt-get install -y nova-api nova-cert novnc nova-consoleauth nova-scheduler nova-novncproxy nova-doc nova-conductor
apt-get install -y openstack-dashboard
