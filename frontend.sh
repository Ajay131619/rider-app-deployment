#!/bin/bash

user=$( id -u )

if [ $user -eq 0 ]
    then
        echo " the script is started "
    else
        echo " please, run the script using root privileges "
    exit 1
fi

installation(){
 dnf list installed nginx
    
if [ $? -eq 0 ]
    then
        echo " nginx is already installed "
        exit 1
    else
        echo " going to install the nginx "
        dnf install nginx -y
    if [ $? -eq 0 ]
        then
            echo " successfully installed nginx "
        else
            echo " script was not successfull !! "
            echo " please , check it once !! "
    fi


fi

}

installation()

systemctl start nginx
systemctl enable nginx

systemctl status nginx

netstat -lntp
