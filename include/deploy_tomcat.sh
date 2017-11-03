#!/bin/bash

#修改相关服务项的配置。暂时包含mysql、nginx和tomcat
Deploy_Tomcat(){

  if [[ ${need_tomcat_yn} == "y" ]]; then
    service tomcat stop
    [ -e "./config/tomcat/server.xml" ] && \cp -f ./config/tomcat/server.xml ${tomcat_install_dir}/conf/

    #部署项目
    \cp -rf ./app/server/* "${tomcat_install_dir}/webapps"
#    war_list=`find ./app -name "*.war"`
#    if [ ${#war_list[*]} -lt 1 ]; then
#      echo "Can't find any war package!"
#      exit 1
#    else
#      for war in ${war_list}
#      do
#        #${war}是查找到的war文件的相对路径。copy到tomcat的webapp目录下。
#        \cp -f "${war}" "${tomcat_install_dir}/webapps"
#      done
#    fi
    service tomcat start
  fi
}







