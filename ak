#!/bin/bash
# ak main

source "$AK_ROOT"/lib/print.sh
source "$AK_ROOT"/lib/json.sh

function version() {
  head -1 "$AK_ROOT"/VERSION
}

function update() {
  echo "当前版本:$(version)"

  install_path=/usr/local/

  case $1 in
  "")
    versionStr=$(get_json_value "$(curl https://api.github.com/repos/comeonjy/ak/releases/latest)" "tag_name" | awk '$1=$1')
    version=${versionStr:1}
    pkg_path=https://codeload.github.com/comeonjy/ak/tar.gz/refs/tags/v${version}
    ;;
  *)
    version=$1
    pkg_path=https://codeload.github.com/comeonjy/ak/tar.gz/refs/heads/${version}
    ;;
  esac

  if [ -d "${install_path}ak-${version}" ]; then
    read -r -p "目录 ${install_path}ak-${version} 已存在，是否覆盖？[Y/N] (Y):" answer
    case $answer in
    "Y" | "y" | "")
      echo "继续安装"
      ;;
    *)
      echo "取消安装"
      exit 0
      ;;
    esac
  fi

  curl -o ak-"${version}".tar.gz "${pkg_path}"
  tar -xf ak-"${version}".tar.gz -C ${install_path}
  /bin/cp ${install_path}ak-"${version}"/ak /usr/bin/
  echo "${version}" >${install_path}ak-"${version}"/VERSION
  rm -f ak-"${version}".tar.gz

  if ! grep "export AK_ROOT=" ~/.bash_profile; then
    echo "export AK_ROOT=${install_path}ak-${version}" >>~/.bash_profile
  else
    sed -i "s:export AK_ROOT=.*:export AK_ROOT=${install_path}ak-${version}:" ~/.bash_profile
  fi
  source ~/.bash_profile

  echo "使用 source ~/.bash_profile 使用新版本"

  echo "已经更新为版本:${version}"
}

function install-plugin() {
  read -r -d "EOF" file
  echo "$file" >"$AK_ROOT/base/$1.sh"
  ak _mk_help
}

function _mk_help() {
  cat >"$AK_ROOT"/ak.help <<EOF
AK devops script collection.
Usage: ak <command> ...
Commands:

 update [branch]           :更新版本
                            使用 "ak update" 安装最新稳定版本
                            使用 "source ak update [branch]" 立即使用新版本

 install-plugin            :安装插件

                            Example:
                              ak install-plugin script-name < script-name.sh
                              curl http://xxx/honeypot.sh | ak install-plugin honeypot

 <script>                  :执行对应脚本
 version                   :查看版本
 help                      :查看帮助

Scripts:

EOF

  for i in "$AK_ROOT"/base/*.sh; do
    {
      echo " $(basename "$i" .sh):"
      grep "^#[^\!]" "$i" | cut -c 2- | awk '{print " "$0}'
      echo ""
    } >>"$AK_ROOT"/ak.help
  done
}

function help() {
  cat <"$AK_ROOT"/ak.help | less
}

if [ $# == 0 ]; then
  help
else
  case $1 in
  "help" | "version" | "update" | "install-plugin" | "_mk_help")
    "$@"
    ;;
  *)
    # shellcheck source=$AK_ROOT/base/$1.sh
    source "$AK_ROOT"/base/"$1".sh "${@:2}"
    ;;
  esac
fi
