#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/mysql/bin
clear

. ./check_services.sh
. ./init_database.sh
. ./deploy.sh
#
## Check if user is root
#[ $(id -u) != "0" ] && { echo "${CFAILURE}Error: You must be root to run this script${CEND}"; exit 1; }
#
##在安装各个应用之前，先检查一下这些应用的服务是否已经存在了
#Check_Services
#
##安装各个应用
##. ./oneinstack/install.sh
#. ./test.sh
#if [ "$?" != '0' ]; then
#  echo "An error occurred while running the install script"
#  exit 1
#fi

#Init_Database

Deploy






