#!/bin/bash

. ./lnmt.conf
. ./include/check_os.sh
. ./include/check_services.sh

if [[ ${uninstall_web_yn} == "y" ]]; then
  Check_Exists nginx
  nginx_check=$?
  Check_Exists tomcat
  tomcat_check=$?

  if [[ nginx_check -eq 0 ]]; then
    echo "Nginx service will be uninstalled..."
  fi

  if [[ tomcat_check -eq 0 ]]; then
    echo "Tomcat service will be uninstalled..."
  fi

  if [[ nginx_check -eq 0 ]] || [[ tomcat_check -eq 0 ]]; then
    cd oneinstack
    . ./uninstall.sh web
    cd ..
  fi
fi

if [[ ${uninstall_mysql_yn} == "y" ]]; then
  Check_Exists mysqld
  if [[ $? -eq 0 ]]; then
    echo "Mysql service will be uninstalled..."
    cd oneinstack
    . ./uninstall.sh db
    cd ..
  fi
fi

#重启系统来清除对应的服务
echo "Please restart the server and see if the services has been stopped."
read -p "Press any key to restart OS..." restart_yn
reboot
