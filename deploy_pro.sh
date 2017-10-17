#!/bin/bash

Deploy_Pro(){

    #部署项目
#    echo "Start to deploy......"
    war_list=`find ./war -name "*.war"`

    if [ ${#war_list[*]} -lt 1 ]; then
        echo "Can't find any war package!"
        exit 1
    else
        service tomcat stop
        for war in ${war_list}
        do
            #${war}是查找到的war文件的相对路径。wwwroot_dir是网站根目录，在安装时设置的。
            \cp -f "${war}" "${wwwroot_dir}/default"
        done
        service tomcat start
    fi
}








