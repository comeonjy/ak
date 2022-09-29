#!/bin/bash
# golang自动安装脚本


function install() {
  echo "执行以下命令将go加入环境变量"
  echo "   echo 'export GOROOT=/usr/local/go'  >> ~/.bashrc "
  echo "   echo 'export PATH=\$PATH:\$GOROOT/bin' >> ~/.bashrc "

  if [ $# == 0 ] || [ "$1" == "--help" ]
  then
    echo "default install path is /usr/local/"
    echo "Use 'install-go list' to view the list of installable go programs"
    return
  fi

  if go version 1>/dev/null ;
  then
    echo "go already install:" "$(go version)"
    echo "请先卸载go"
    return
  fi

  wget https://go.dev/dl/$1.tar.gz

  if [ -d /usr/local/go ];then
    read -r -p "目录 /usr/local/go 已存在，是否覆盖？[Y/N] (Y):" answer
    case $answer in
    "Y"|"y"|"")
      echo "继续安装"
      ;;
    *)
      echo "取消安装"
      exit 0
    esac
  fi

  tar -xvf $1.tar.gz -C /usr/local/
  export GOROOT=/usr/local/go
  export PATH=$PATH:$GOROOT/bin
  rm -f $1.tar.gz
  go version

}

function list() {
  echo "installable:"
  echo " go1.18.5.linux-amd64"
  echo "removeable:"
  echo " go1.17.5.linux-amd64"
}

function help() {
    echo "Go auto install script."
    echo "Usage: install-go <command> ..."
    echo ""
    echo "Commands:"
    echo " install <version> :安装指定版本golang"
    echo " list              :列出所有可以安装的版本"
    echo ""
    echo "Use 'install-go <command> --help' for more information about a given command "
}

if [ $# == 0 ];then help; else "$@";fi
