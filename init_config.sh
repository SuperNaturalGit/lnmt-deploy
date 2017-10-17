#!/bin/bash

#修改相关服务项的配置。暂时包含mysql、nginx和tomcat
Init_Config(){

  #重新覆盖一次nginx的配置文件。
  if [[ "${need_nginx_yn}" == "y" ]] && [ -e "./config/nginx/nginx.conf" ]; then
    echo "Start to init config for nginx."
    \cp -f ./config/nginx/nginx.conf ${nginx_install_dir}/conf/nginx.conf
    service nginx restart
    echo "Init config for nginx success."
  fi

  #重新覆盖一下tomcat的server.xml文件。如果是多应用，或者需要修改tomcat的端口号，可以在配置文件里修改。
  if [[ "${need_tomcat_yn}" == "y" ]] && [ -e "./config/tomcat/server.xml" ]; then
    echo "Start to init config for tomcat."
    \cp -f ./config/tomcat/server.xml ${tomcat_install_dir}/conf/
    service tomcat restart
    echo "Init config for tomcat success."
  fi

  #重新覆盖一次mysql的配置文件。
  #注意这个配置文件的内容要跟oneinstack中安装时的mysql安装目录和数据目录保持一致
  if [[ "${init_database_yn}" == "y" ]] && [ -e "./config/mysql/my.cnf" ]; then
    echo "Start to init config for mysql."
    \cp -f ./config/tomcat/my.cnf /etc/
    service mysqld restart
  fi
}







