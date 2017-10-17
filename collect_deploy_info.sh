#!/bin/bash

Collect_Deploy_Info(){

  while :; do echo
    read -p "Does this web app needs Nginx service? [y/n]: " need_nginx_yn
    if [[ ! $need_nginx_yn =~ ^[y,n]$ ]]; then
      echo "Input error! Please only input 'y' or 'n'"
    else
      break
    fi
  done

  while :; do echo
    read -p "Does this web app needs Tomcat service? [y/n]: " need_tomcat_yn
    if [[ ! $need_tomcat_yn =~ ^[y,n]$ ]]; then
      echo "Input error! Please only input 'y' or 'n'"
    else
      break
    fi
  done

  #是否在本机初始化项目数据（执行mysql脚本）
  while :; do echo
    read -p "Do you want to initialize the database for your project(MySQL)? [y/n]: " init_datebase_yn
    if [[ ! $init_datebase_yn =~ ^[y,n]$ ]]; then
      echo "Input error! Please only input 'y' or 'n'"
    else
      break
    fi
  done

  if [[ "${init_datebase_yn}" == "y" ]]; then
    #是否开放3306端口号
    while :; do echo
      read -p "Do you want to open the 3306 port for MySQL? [y/n]: " mysql_port_yn
      if [[ ! $mysql_port_yn =~ ^[y,n]$ ]]; then
        echo "Input error! Please only input 'y' or 'n'"
      else
        break
      fi
    done

    #数据库root密码
    read -p "Please input the root password of database: " dbrootpwd
  fi

}





