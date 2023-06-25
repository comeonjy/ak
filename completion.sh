#!/usr/bin/env bash

function _docker-completion() {
  case ${COMP_WORDS[$((COMP_CWORD - 1))]} in
  "goto")
    COMPREPLY=()
    if [[ -n ${COMP_WORDS[$((COMP_CWORD))]} ]]; then
      while IFS='' read -r line; do COMPREPLY+=("$line"); done < <(compgen -W "$(docker ps --format "{{.Names}}" | grep ${COMP_WORDS[$((COMP_CWORD))]})" )
    else
      while IFS='' read -r line; do COMPREPLY+=("$line"); done < <(compgen -W "$(docker ps --format "{{.Names}}")" ${COMP_WORDS[$((COMP_CWORD))]})
    fi
    ;;
  esac
}

function _ak_completions() {
  if [ "$COMP_CWORD" -eq 1 ]; then
      COMPREPLY=($(compgen -W "$(cat $AK_ROOT/ak | grep -E "^function" | awk -F "(" '{print $1}' | cut -c 9- | grep -v "_" )" ${COMP_WORDS[$COMP_CWORD]}))
      COMPREPLY+=($(compgen -W "$(ls $AK_ROOT/base | awk -F "." '{print $1}')" ${COMP_WORDS[$COMP_CWORD]}))
  elif [ "$COMP_CWORD" -eq 2 ]; then
    COMPREPLY=($(compgen -W "$(cat $AK_ROOT/base/${COMP_WORDS[1]}.sh | grep -E "^function" | awk -F "(" '{print $1}' | cut -c 9- | grep -v "_" )" ${COMP_WORDS[$COMP_CWORD]}))
  else
    if type "_${COMP_WORDS[1]}"-completion &>/dev/null ; then
        _"${COMP_WORDS[1]}"-completion
    fi
  fi
}

complete -F _ak_completions ak
