#!/bin/bash

clear

. check_services.sh

#在安装各个应用之前，先检查一下这些应用的服务是否已经存在了
Check_Services

#调用oneinstack安装各个应用
cd oneinstack
. ./install.sh
#cd ..






