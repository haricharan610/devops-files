#!/bin/bash
set -e

component="${1:?Missing component name}"
env="${2:?Missing environment name}"

dnf install ansible -y

ansible-pull \
  -U https://github.com/haricharan610/devops-files.git \
  -e "component=$component" \
  -e "env=$env" \
  ansible-roboshop-roles/main.yml