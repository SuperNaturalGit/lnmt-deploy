#!/bin/bash

. ./lnmt.conf

cd ./oneinstack
if [[ ${uninstall_web_yn} == "y" ]]; then
  ./uninstall.sh web
fi

if [[ ${uninstall_mysql_yn} == "y" ]]; then
   ./uninstall.sh db
cd ..
