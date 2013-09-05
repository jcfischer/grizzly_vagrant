#! /bin/bash

source ./functions.sh

mysql -u root -e "create database nova;"
mysql -u root -e "grant all on nova.* to 'novaUser'@'%' identified by 'novaPass';"
mysql -u root -e "grant all on nova.* to 'novaUser'@'localhost' identified by 'novaPass';"


TENANT_ID_SERVICE=$(keystone tenant-get service | grep ' id ' | get_field 2)
USER_ID_NOVA=$(keystone user-create --name nova --pass novaServ --tenant-id ${TENANT_ID_SERVICE} | grep ' id ' | get_field 2)

keystone user-role-add --tenant service --user nova --role admin

SERVICE_ID_NOVA=$(keystone service-create --name nova --type compute --description 'OpenStack Nova Service' | grep ' id ' | get_field 2)

keystone endpoint-create --region RegionOne --service_id $SERVICE_ID_NOVA --publicurl 'http://api-node.example.org:8774/v2/$(tenant_id)s' --adminurl 'http://api-node.example.org:8774/v2/$(tenant_id)s' --internalurl 'http://api-node:8774/v2/$(tenant_id)s'

SERVICE_ID_EC2=$(keystone service-create --name ec2 --type ec2 --description 'OpenStack EC2 Service' | grep ' id ' | get_field 2)

keystone endpoint-create --region RegionOne --service_id $SERVICE_ID_EC2 --publicurl 'http://api-node.example.org:8773/services/Cloud' --adminurl 'http://api-node.example.org:8773/services/Admin' --internalurl 'http://api-node:8773/services/Cloud'

