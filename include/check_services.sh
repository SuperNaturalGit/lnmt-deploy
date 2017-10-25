#!/bin/bash

#检查某一项服务是否存在，0表示存在，1表示不存在
Check_Exists(){
  process=$1
  process_count=`ps -ef |grep ${process} | grep -v grep | wc -l`
  if [[ ${process_count} -ne 0 ]]; then
    return 0
  fi

  if [[ ${OS} == "CentOS" ]] && [[ ${CentOS_RHEL_version} -eq 7 ]]; then
    service_count=`systemctl status ${process} | grep -v grep | wc -l`
  else
    service_count=`service ${process} status | grep -v grep | wc -l`
  fi

  if [[ ${service_count} -ne 0 ]]; then
    if [[ ${OS} == "CentOS" ]] && [[ ${CentOS_RHEL_version} -eq 7 ]]; then
      service_notfound_count=`systemctl status ${process} | grep not-found | wc -l`
    else
      service_notfound_count=`service ${process} status | grep not-found | wc -l`
    fi
    if [[ ${service_notfound_count} -eq 0 ]]; then
      return 0
    else
      return 1
    fi
  fi
  return 1
}

#在安装应用之前，检查系统中是否已经有已启动的相关服务
Check_Services_Exists(){
    #检查mysql的服务已经存在
    Check_Exists mysqld
    if [[ $? -eq 0 ]]; then
      echo "The mysql service is already exist, please uninstall it before run this script."
      exit 1
    fi

    #检查nginx的服务已经存在
    Check_Exists nginx
    if [[ $? -eq 0 ]]; then
      echo "The nginx service is already exist, please uninstall it before run this script."
      exit 1
    fi

    #检查tomcat的服务已经存在
    Check_Exists tomcat
    if [[ $? -eq 0 ]]; then
      echo "The tomcat service is already exist, please uninstall it before run this script."
      exit 1
    fi
}

#部署项目之前，检查项目相关的服务是否已经准备就绪。
Check_Services_Ready(){

  #如果要在本机部署代码，需要检查nginx服务是否已安装
  if [ ${need_nginx_yn} == "y" ]; then
    Check_Exists nginx
    if [[ $? -ne 0 ]]; then
      echo "The nginx service is not ready, please check whether you have installed this service."
      exit 1
    fi
  fi

  #如果要在本机部署代码，需要检查tomcat服务是否已安装
  if [ ${need_tomcat_yn} == "y" ]; then
    Check_Exists tomcat
    if [[ $? -ne 0 ]]; then
      echo "The tomcat service is not ready, please check whether you have installed this service."
      exit 1
    fi
  fi

  #如果数据库也安装在本机，需要检查mysql服务是否已安装
  if [ ${need_mysql_yn} == "y" ]; then
    Check_Exists mysqld
    if [[ $? -ne 0 ]]; then
      echo "The mysql service is not ready, please check whether you have installed this service."
      exit 1
    fi
  fi
}




