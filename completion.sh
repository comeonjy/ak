#!/usr/bin/env bash

function _ak_completions() {

  local first
  if [ "$COMP_CWORD" -lt 3 ]; then
    first=${COMP_WORDS[$((COMP_CWORD - 1))]}
  else
    first=${COMP_WORDS[$((COMP_CWORD - 2))]}
  fi

  case $first in
  "docker")
    COMPREPLY=($(compgen -W "$(cat $AK_ROOT/base/docker.sh | grep -E "^function" | awk -F "(" '{print $1}' | cut -c 9-)" ${COMP_WORDS[$((COMP_CWORD))]}))

    case ${COMP_WORDS[$((COMP_CWORD - 1))]} in
    "goto")
      if [[ -n ${COMP_WORDS[$((COMP_CWORD))]} ]]; then
        COMPREPLY=($(compgen -W "$(docker ps --format "{{.Names}}" | grep ${COMP_WORDS[$((COMP_CWORD))]})" ${COMP_WORDS[$((COMP_CWORD))]}))
      else
        COMPREPLY=($(compgen -W "$(docker ps --format "{{.Names}}")" ${COMP_WORDS[$((COMP_CWORD))]}))
      fi
      ;;
    esac

    ;;
  "example")
    COMPREPLY=($(compgen -W "$(cat $AK_ROOT/base/example.sh | grep -E "^function" | awk -F "(" '{print $1}' | cut -c 9-)" ${COMP_WORDS[$((COMP_CWORD))]}))
    ;;
  *)
    if [ "$COMP_CWORD" -lt 3 ]; then
      COMPREPLY=($(compgen -W "help version update install-plugin" ${COMP_WORDS[$((COMP_CWORD))]}))
      COMPREPLY+=($(compgen -W "$(ls $AK_ROOT/base | awk -F "." '{print $1}')" ${COMP_WORDS[$((COMP_CWORD))]}))
    fi

    ;;
  esac

}

complete -F _ak_completions ak
