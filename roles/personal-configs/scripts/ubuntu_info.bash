#!/bin/bash

if [ -d /etc/upstream-release ] ; then
    release_num=`cat /etc/upstream-release/lsb-release | grep DESCRIPTION | awk -F 'Ubuntu ' '{print $2}' | awk -F ' LTS' '{print $1}'`
    codename=`cat /etc/upstream-release/lsb-release | grep CODENAME | awk -F '=' '{print $2}'`
else
    release_num=`cat /etc/lsb-release | grep DESCRIPTION | awk -F 'Ubuntu ' '{print $2}' | awk -F ' LTS' '{print $1}'`
    codename=`cat /etc/lsb-release | grep CODENAME | awk -F '=' '{print $2}'`
fi

if [ "$1" == "-c" ] ; then
  echo $codename
elif [ "$1" == "-v" ] ; then
  echo $release_num
fi
