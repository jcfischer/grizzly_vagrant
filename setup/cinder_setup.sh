#! /bin/bash

source ./functions.sh

mysql -u root -e "create database cinder;"
mysql -u root -e "grant all on cinder.* to 'cinderUser'@'%' identified by 'cinderPass';"
mysql -u root -e "grant all on cinder.* to 'cinderUser'@'localhost' identified by 'cinderPass';"


TENANT_ID_SERVICE=$(keystone tenant-get service | grep ' id ' | get_field 2)
USER_ID_CINDER=$(keystone user-create --name cinder --pass cinderServ --tenant-id ${TENANT_ID_SERVICE} | grep ' id ' | get_field 2)

keystone user-role-add --tenant service --user cinder --role admin

SERVICE_ID_VOLUME=$(keystone service-create --name cinder --type volume --description 'OpenStack Volume Service' | grep ' id ' | get_field 2)

keystone endpoint-create --region RegionOne --service_id $SERVICE_ID_VOLUME --publicurl "http://volume-node.example.org:8776/v1/$(tenant_id)s" --adminurl "http://volume-node.example.org:8776/v1/$(tenant_id)s" --internalurl "http://volume-node:8776/v1/$(tenant_id)s"

