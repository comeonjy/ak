#!/bin/bash
# 容器相关的脚本工具

source "$AK_ROOT"/lib/print.sh

function goto() {
  if [ -z "$1" ]; then
    help
    return 0
  fi
  path=$(docker inspect "$1" | grep MergedDir | awk -F ':' '{print $2}' | cut -c 3- | rev | cut -c 3- | rev)
  echo "$path"
  source cd "${path}" 2>/dev/null
}

function help() {
  echo '''
docker script.
Usage: docker <command> ...

Commands:
 goto    <container_name> :进入指定容器实际存储目录
                           source ak docker goto <container_name>
 help                     :查看帮助
 '''
}

if [ $# = 1 ]; then help; else "${@:2}"; fi
