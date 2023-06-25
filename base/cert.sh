#!/bin/bash
# 证书相关的脚本工具

source "$AK_ROOT"/lib/print.sh

function create() {
  DOMAIN=$1
  if [ -z "$DOMAIN" ]; then
    read -p "Enter your domain [www.example.com]: " DOMAIN
  fi
  openssl genrsa -out $DOMAIN.key 2048
  openssl req -new -subj "/C=CN/ST=SL/L=CD/O=QM/OU=QMXC/CN=$DOMAIN" -key $DOMAIN.key -out $DOMAIN.csr
  openssl x509 -req -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt
}

function help() {
  echo '''
cert script.
Usage: cert <command> ...

Commands:
 create    <domain> :创建指定域名的自签证书，使用openssl实现
 help               :查看帮助
  '''
}

if [ $# = 1 ]; then help; else "${@:2}"; fi
