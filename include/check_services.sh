#!/bin/bash

#在安装应用之前，检查系统中是否已经有已启动的相关服务
Check_Services_Exists(){
    #检查mysql的进程是否已经存在
    mysql_process_count=`ps -ef | grep mysql | grep -v grep | wc -l`
    mysql_service_count=`service mysqld status | grep -v grep | wc -l`
    if [[ ${mysql_process_count} -ne 0 ]] || [[ ${mysql_service_count} -ne 0 ]]; then
        echo "The mysql service is already exist, please uninstall it before run this script."
        exit 1
    fi

    #检查nginx进程是否已经存在
    nginx_process_count=`ps -ef | grep nginx | grep -v grep | wc -l`
    nginx_service_count=`service nginx status | grep -v grep | wc -l`
    if [ "${nginx_process_count}" -ne 0 ] || [[ ${nginx_service_count} -ne 0 ]]; then
        echo "The nginx service is already exist, please uninstall it before run this script."
        exit 1
    fi

    #检查tomcat进程是否已经存在
    tomcat_process_count=`ps -ef | grep tomcat | grep -v grep | wc -l`
    tomcat_service_count=`service tomcat status | grep -v grep | wc -l`
    if [[ "${tomcat_process_count}" -ne 0 ]] || [[ ${tomcat_service_count} -ne 0 ]]; then
        echo "The tomcat service is already exist, please uninstall it before run this script."
        exit 1
    fi
}

#部署项目之前，检查项目相关的服务是否已经准备就绪。
Check_Services_Ready(){

  #如果要在本机部署代码，需要检查nginx服务是否已安装
  if [ ${need_nginx_yn} == "y" ]; then
    nginx_process_count=`ps -ef | grep nginx | grep -v grep | wc -l`
    if [ ${nginx_process_count} -eq 0 ]; then
      count=`service nginx status | grep -v grep | wc -l`
      if [[ ${count} -eq 0 ]]; then
        echo "The nginx service is not running, please check whether you have installed this service."
        exit 1
      fi
    fi
  fi

  #如果要在本机部署代码，需要检查tomcat服务是否已安装
  if [ ${need_tomcat_yn} == "y" ]; then
    tomcat_process_count=`ps -ef | grep tomcat | grep -v grep | wc -l`
    if [ ${tomcat_process_count} -eq 0 ]; then
      count=`service tomcat status | grep -v grep | wc -l`
      if [[ ${count} -eq 0 ]]; then
        echo "The tomcat service is not running, please check whether you have installed this service."
        exit 1
      fi
    fi
  fi

  #如果数据库也安装在本机，需要检查mysql服务是否已安装
  if [ ${init_database_yn} == "y" ]; then
    #检查mysql的进程是否已经存在
    mysql_process_count=`ps -ef | grep mysql | grep -v grep | wc -l`
    if [ ${mysql_process_count} -eq 0 ]; then
      count=`service mysqld status | grep -v grep | wc -l`
      if [[ ${count} -eq 0 ]]; then
        echo "The mysql service is not running, please check whether you have installed this service."
        exit 1
      fi
    fi
  fi
}




