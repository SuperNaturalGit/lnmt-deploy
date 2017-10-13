#!/bin/bash

Init_Database(){
    #执行数据库初始化脚本

    #重新覆盖一次mysql的配置文件。
    #注意这个配置文件的内容要跟oneinstack中安装时的mysql安装目录和数据目录保持一致
    if [ -e "./config/my.cnf" ];then
        service mysqld stop
        echo "Copy my.cnf"
        \cp -f ./config/my.cnf /etc/
        service mysqld start
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
        #注意这里的root密码是之前安装mysql时输入的密码
        mysql -uroot -pwafer <./sql/${sql_file}
    done
}







