#!/bin/bash
# ak main

source "$AK_ROOT"/lib/print.sh

function version() {
  head -1 "$AK_ROOT"/VERSION
}

function update() {
  echo "当前版本:$(version)"
  curl -o ak-install.sh https://raw.githubusercontent.com/comeonjy/ak/main/install.sh && bash ak-install.sh && rm -f ak-install.sh
  echo "已经更新为最新版本:$(version)"
}

function install-plugin() {
    read -r file
    echo "$file" >> "$AK_ROOT/base/$1.sh"
    ak _mk_help
}

function _mk_help() {
  cat > "$AK_ROOT"/ak.help <<EOF
ak devops script collection.
Usage: ak <command> ...
Commands:

 update             :更新版本
 version            :查看版本
 help               :查看帮助
 install-plugin     :安装插件
                     ak install-plugin script-name < script-name.sh
 <script>           :执行对应脚本

Scripts:

EOF

  for i in "$AK_ROOT"/base/*.sh;do
    {
    echo " $(basename "$i" .sh):"
    grep "^#[^\!]" "$i" | cut -c 2- | awk '{print " "$0}'
    echo ""
     }>> "$AK_ROOT"/ak.help
  done
}

function help() {
    cat < "$AK_ROOT"/ak.help | less
}

if [ $# == 0 ];then
  help
else
  case $1 in
  "help"|"version"|"update"|"install-plugin"|"_mk_help")
    "$@"
    ;;
  *)
    bash "$AK_ROOT"/base/"$1".sh "${@:2}"
    ;;
  esac
fi


