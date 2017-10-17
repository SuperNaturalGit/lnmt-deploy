#!/bin/bash

#以5分钟为时限，检查某一个进程是否启动成功
Check_Process_Start(){
  echo "Check_Process_Start"
  process=$1
  start_time=`date +%s`
  end_time=`date +%s`

  while [[ $[${end_time}-${start_time}] -lt 300 ]]
  do
    sleep 1
    end_time=`date +%s`
    [[ `ps -ef | grep ${process} | grep -v grep | wc -l` -ne 0  ]] && return 0
  done
  return 1
}
#以5分钟为时限，检查某一个进程是否停止成功
Check_Process_Stop(){
  process=$1
  start_time=`date +%s`
  end_time=`date +%s`

  while [[ $[${end_time}-${start_time}] -lt 300 ]]
  do
    sleep 3
    end_time=`date +%s`
    [[ `ps -ef | grep ${process} | grep -v grep | wc -l` -eq 0  ]] && return 0
  done
  return 1
}






