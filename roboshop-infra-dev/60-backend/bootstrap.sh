#!/bin/bash
set -e

component=$1
env=$2

dnf install -y ansible-core git

git clone https://github.com/haricharan610/ansible-roboshop-roles.git /tmp/ansible-roboshop-roles

cd /tmp/ansible-roboshop-roles

ansible-playbook \
  -i "${component}," \
  -c local \
  -e "component=$component" \
  -e "env=$env" \
  main.yml