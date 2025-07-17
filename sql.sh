#!/bin/bash

user=$(id -u)


if [ $user -eq 0 ]
    then
        echo " installing the software "
    else
        echo " do the script using the root privileges "
        exit 1
fi

dnf install mysql-server -y

dnf list installed mysql


setting_password(){

    dnf list installed mysql

    mysql_secure_installation --set-root-pass mysql

if [ $? -eq 0 ]
    then
        echo " script is successful "
    else
        echo " please check the and do it manually "
fi

}

setting_password
