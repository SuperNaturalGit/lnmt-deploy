#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/mysql/bin
clear

. ./oneinstack/options.conf
. include/collect_deploy_info.sh
. include/check_services.sh
. include/deploy_nginx.sh
. include/deploy_mysql.sh
. include/deploy_tomcat.sh


cd oneinstack
. ./include/check_os.sh
cd ..

#
# Check if user is root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

Collect_Deploy_Info

Check_Services_Ready

Deploy_MySQL

Deploy_Tomcat

Deploy_Nginx






