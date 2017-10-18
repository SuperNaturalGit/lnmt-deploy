#!/bin/bash

#修改相关服务项的配置。暂时包含mysql、nginx和tomcat
Deploy_Nginx(){

  #重新覆盖一次nginx的配置文件。
  if [[ ${need_nginx_yn} == "y" ]]; then
    echo "Start to init config for nginx."
    [ -e "./config/nginx/nginx.conf" ] && \cp -f ./config/nginx/nginx.conf ${nginx_install_dir}/conf/nginx.conf
    service nginx restart
  fi
#  if [[ ${need_nginx_yn} == "y" ]]; then
#    echo "Start to init config for nginx."
#    if [ -e "./config/nginx/nginx.conf" ]; then
#      \cp -f ./config/nginx/nginx.conf ${nginx_install_dir}/conf/nginx.conf
#      service nginx restart
#    else
#      nginx_process_count=`ps -ef | grep nginx | grep -v grep | wc -l`
#      if [ ${nginx_process_count} -eq 0 ]; then
#        service nginx start
#      fi
#    fi
#  fi
}







