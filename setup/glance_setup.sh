#! /bin/bash

source ./functions.sh

mysql -u root -e "create database glance;"
mysql -u root -e "grant all on glance.* to 'glanceUser'@'%' identified by 'glancePass';"
mysql -u root -e "grant all on glance.* to 'glanceUser'@'localhost' identified by 'glancePass';"


TENANT_ID_SERVICE=$(keystone tenant-get service | grep ' id ' | get_field 2)
USER_ID_GLANCE=$(keystone user-create --name glance --pass glanceServ --tenant-id ${TENANT_ID_SERVICE} | grep ' id ' | get_field 2)

keystone user-role-add --tenant service --user glance --role admin

SERVICE_ID_IMAGE=$(keystone service-create --name glance --type image --description 'OpenStack Image Service' | grep ' id ' | get_field 2)

keystone endpoint-create --region RegionOne --service_id $SERVICE_ID_IMAGE --publicurl "http://image-node.example.org:9292/v2" --adminurl "http://image-node:9292/v2" --internalurl "http://image-node::9292/v2"

