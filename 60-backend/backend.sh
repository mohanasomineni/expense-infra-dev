#!/bin/bash

dnf install ansible -y
#PUSH
# ansible-playbook -i inventory mysql.yaml

#PULL
ansible-pull -i localhost, -U https://github.com/mohanasomineni/expense-ansible-roles-tf.git main.yaml -e COMPONENT=backend -e ENVIRONMENT=$1