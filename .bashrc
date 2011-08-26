# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

export EDITOR=/usr/bin/mcedit
export USE_BUNDLER=try

for script in ~/.alias ~/.functions ~/.rvm/scripts/{rvm,completion} ~/.profile
do source $script || true ; done

shopt -s promptvars dotglob histappend no_empty_cmd_completion cdspell xpg_echo

show_git() {
  local limit=$(git config dir.limit 2>/dev/null) path=$PWD top=$(git rev-parse --show-toplevel 2>/dev/null)
  [[ -z "$limit" ]] && return 0
  while (( limit >= 0 ))
  do
    case "$path" in
      $top) return 0 ;;
      /|$HOME) return 1 ;;
    esac
    path=$(dirname $path)
    : $(( --limit ))
  done
  return 1
}
function pgd {
  show_git && echo -n $(
    git status 2>/dev/null | awk -v out=$1 -v std="dirty" '{ if ($0=="# Changes to be committed:") std = "uncommited"; last=$0 } \
      END{ if(last!="" && last!="nothing to commit (working directory clean)") { if(out!="") print out; else print std } }'
  )
}
function pgb {
  show_git && echo -n "$(git branch --no-color 2>/dev/null | awk -v out="$1"\
   '/^*/ { if(out=="") print $2; else print out}')" #'
}
function pgr {
  show_git && echo -n "$(git status 2>/dev/null | awk -v out="$1" '/# Your branch is / { if(out=="") print $5; else print out }')" #'
}
function _rvm_curr {
  local rvm=$(rvm current)
  [[ -n "${rvm}" ]] && printf "${rvm##ruby-} "
}
export PS1='($?) \[\033[36m\]$(_rvm_curr)\[\033[0m\]\u@\h:\[\033[33m\]\w\[\033[0m\]$(pgb " ")\[\033[36m\]$(pgb )\[\033[0m\]$(pgr "(")\[\033[35m\]$(pgr )\[\033[0m\]$(pgr ")")\[\033[0m\]$(pgd "[")\[\033[31m\]$(pgd)\[\033[0m\]$(pgd "]")\[\033[1;33m\]>\[\033[0m\]'
