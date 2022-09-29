#!/bin/bash

version=v0.0.1
install_path=/usr/local/
pkg_path=https://github.com/comeonjy/ak/archive/refs/tags/

if [ "$1" != "" ]; then
    version=$1
fi

if [ -d ${install_path}ak ];then
  read -r -p "目录 ${install_path}ak 已存在，是否覆盖？[Y/N] (Y):" answer
  case $answer in
  "Y"|"y"|"")
    echo "继续安装"
    ;;
  *)
    echo "取消安装"
    exit 0
  esac
fi

curl -o ak-"${version}".tar.gz ${pkg_path}"${version}".tar.gz
tar -xvf ak-"${version}".tar.gz -C ${install_path}
rm -f ak-"${version}".tar.gz

if ! grep "export AK_ROOT="  ~/.bash_profile ;then
  echo "export AK_ROOT=${install_path}ak" >> ~/.bash_profile
  echo "export PATH=\$PATH:\$AK_ROOT" >> ~/.bash_profile
  source ~/.bash_profile
fi

