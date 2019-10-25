#!/bin/bash
ssh-keygen -f $PWD/key_access_asg_nginx_example
mkdir -p common/ssh ~/ssh_custom_keys
mv $PWD/key_access_asg_nginx_example.pub $PWD/common/ssh/key_access_asg_nginx_example.pub
mv $PWD/key_access_asg_nginx_example ~/ssh_custom_keys/key_access_asg_nginx_example.pem
chmod 400 ~/ssh_custom_keys/key_access_asg_nginx_example.pem

cd environments/dev_nginx_elb/
terraform init
terraform apply