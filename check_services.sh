#!/bin/bash

Check_Services(){
    #检查mysql服务是否已经存在
    chkconfig --list | grep mysqld
    if [ "$?" == "0" ]; then
        echo "The mysql service is already exist, please uninstall it before run this script."
        exit 1
    fi

    #检查nginx服务是否已经存在
    chkconfig --list | grep nginx
    if [ "$?" == "0" ]; then
        echo "The nginx service is already exist, please uninstall it before run this script."
        exit 1
    fi

    #检查tomcat服务是否已经存在
    chkconfig --list | grep tomcat
    if [ "$?" == "0" ]; then
        echo "The tomcat service is already exist, please uninstall it before run this script."
        exit 1
    fi
}





