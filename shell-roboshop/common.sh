#!/bin/bash

START_TIME=$(date +%s)
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/roboshop-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SCRIPT_DIR=$PWD

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

check_root(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
        exit 1 #give other than 0 upto 127
    else
        echo "You are running with root access" | tee -a $LOG_FILE
    fi
}

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    else
        echo -e "$2 is ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    fi
}



id roboshop
if [ $? -ne 0 ]
then
     useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop
 else
     echo -e "system user already created.... $Y SKIPPING $N"
fi

app_setup(){
mkdir -p  /app &>>$LOG_FILE
VALIDATE $? "creating app directory"

curl -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip
VALIDATE $? "downloading $app_name"

cd /app &>>$LOG_FILE
VALIDATE $? "changing to app directory"

rm -rf /app/* &>>$LOG_FILE

unzip -o /tmp/$app_name.zip &>>$LOG_FILE
VALIDATE $? "unzipping $app_name services"
}


systemd_setup(){
cp $SCRIPT_DIR/$app_name.service /etc/systemd/system/$app_name.service
VALIDATE $? "Copying $app_name service"

systemctl daemon-reload &>>$LOG_FILE
systemctl enable $app_name &>>$LOG_FILE
systemctl start $app_name &>>$LOG_FILE
VALIDATE $? "stating $app_name"
}

print_time(){
    END_TIME=$(date +%s)
    TOTAL_TIME=$(($END_TIME - $START_TIME))
    echo -e "Script executed successfully, $Y Time taken: $TOTAL_TIME seconds $N"
}

