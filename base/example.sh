#!/bin/bash
# 这是一个示例脚本,ak example hello 试试！

source "$AK_ROOT"/lib/print.sh

function hello() {
  pGreen "Hello World! $1"
}

function help() {
  echo '''
example script.
Usage: example <command> ...

Commands:
 hello   :hello
 help    :查看帮助
 '''
}

if [ $# = 1 ]; then help; else "${@:2}"; fi
