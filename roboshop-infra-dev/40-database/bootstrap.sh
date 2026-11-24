ansible-pull \
  -U https://github.com/haricharan610/devops-files.git \
  -e component="$component" \
  -e env="$env" \
  ansible-roboshop-roles/main.yml