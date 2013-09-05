#! /bin/bash

# basic preparation of vm images

sed -i 's/us.archive.ubuntu.com/ch.archive.ubuntu.com/g' /etc/apt/sources.list
#
apt-get update
apt-get install -y ubuntu-cloud-keyring python-software-properties software-properties-common python-keyring
echo deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/grizzly main > /etc/apt/sources.list.d/grizzly.list
#
apt-get update -y
apt-get install ntp -y
# apt-get upgrade -y
#

