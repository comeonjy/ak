#!/bin/bash
# 这是一个示例脚本,ak example hello 试试！

source "$AK_ROOT"/lib/print.sh

function hello() {
    pGreen "Hello World! $1"
}

function help() {
    echo "Please input 'hello'"
}

if [ $# == 0 ];then help; else "$@";fi
