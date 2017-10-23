#!/bin/bash

#修改相关服务项的配置。暂时包含mysql、nginx和tomcat
Deploy_MySQL(){

  #重新覆盖一次mysql的配置文件。
  #注意这个配置文件的内容要跟oneinstack中安装时的mysql安装目录和数据目录保持一致
  if [[ ${init_database_yn} == "y" ]]; then
    echo "Start to init config for mysql."
    #覆盖配置文件
    [ -e "./config/mysql/my.cnf" ] && \cp -f ./config/mysql/my.cnf /etc/

    #对外开放3306接口。需要兼容多个系统版本。
    if [ "${mysql_port_yn}" == "y" ]; then
      if [ "${OS}" == "CentOS" ]; then
        if [ -z "$(grep -w '3306' /etc/sysconfig/iptables)" ]; then
          iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT
          service iptables save
        fi
      elif [[ "${OS}" =~ ^Ubuntu$|^Debian$ ]]; then
        if [ -z "$(grep -w '3306' /etc/iptables.up.rules)" ]; then
          iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT
          iptables-save > /etc/iptables.up.rules
        fi
      fi
    fi

    service mysqld restart

    #挨个执行sql目录下的初始化脚本
    for sql_file in `ls sql`
    do
      mysql -uroot -p${dbrootpwd} <./sql/${sql_file}
      [ "$?" -ne 0 ] && exit 1
    done
  fi
}







