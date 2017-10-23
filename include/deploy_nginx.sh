#!/bin/bash

#修改相关服务项的配置。暂时包含mysql、nginx和tomcat
Deploy_Nginx(){

  #重新覆盖一次nginx的配置文件。
  if [[ ${need_nginx_yn} == "y" ]]; then
    echo "Start to init config for nginx."
    [ -e "./config/nginx/nginx.conf" ] && \cp -f ./config/nginx/nginx.conf ${nginx_install_dir}/conf/nginx.conf
    #前后端代码分离，把app/client目录下的前端代码copy到网站的根目录下。nginx的配置会把相关静态资源代理到这个目录下
    \cp -f ./app/client ${wwwroot_dir}/default
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







