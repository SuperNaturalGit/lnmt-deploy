#!/bin/bash

Deploy(){


    #部署项目
    if [ -e "problemsets-0.0.1.war" ]; then
        service tomcat stop
        unzip -o  problemsets-0.0.1.war -d /usr/local/tomcat/webapps
        service tomcat start
    else
        echo "Can't find problemsets-0.0.1.war!"
        exit 1
    fi
    exit 0
}








