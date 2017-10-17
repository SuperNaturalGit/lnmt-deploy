#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/mysql/bin
clear

. ./oneinstack/options.conf
. ./check_process.sh
. ./collect_deploy_info.sh
. ./check_services.sh
. ./init_database.sh
. ./deploy_pro.sh
. ./init_config.sh



cd oneinstack
. ./include/check_os.sh
cd ..

#
# Check if user is root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

Collect_Deploy_Info

Start_Services

Init_Config

[ "${init_datebase_yn}" == "y" ] && Init_Database

[ "${need_tomcat_yn}" == "y" ] && Deploy_Pro





