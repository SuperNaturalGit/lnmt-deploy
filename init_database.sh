#!/bin/bash

#修改mysql配置，执行数据库初始化脚本
Init_Database(){

    if [ "${mysql_port_yn}" == "y" ]; then
      #对外开放3306接口。需要兼容多个系统版本。
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

    #检查mysql是否正常启动，通过端口号和进程来检查
    port=`netstat -nlt|grep 3306|wc -l`
    process=`ps -ef |grep mysql|grep -v grep |wc -l`
    if [ "$port" == "1" ] && [ "$process" == "2" ]
    then
        echo "MySQL is running"
    else
        service mysqld start
    fi

    #挨个执行sql目录下的初始化脚本
    for sql_file in `ls sql`
    do
      mysql -uroot -p${dbrootpwd} <./sql/${sql_file}
      if [ "$?" -ne 0 ]; then
        exit 1
      fi
    done
}







