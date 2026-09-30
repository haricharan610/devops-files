#!/bin/bash

source ./common.sh
app_name=mysql
check_root

dnf install mysql-server -y &>>$LOG_FILE
VALIDATE $? "installing mysql server"

systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? "enablling mysqld"

systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "starting mysqld"

mysql_secure_installation --set-root-pass RoboShop@1 &>>$LOG_FILE
VALIDATE $? "setting mysql root password"

print_time


