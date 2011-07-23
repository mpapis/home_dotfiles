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

test -s ~/.alias && . ~/.alias || true
test -s ~/.functions && . ~/.functions || true

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"

export USE_BUNDLER=try

shopt -s promptvars dotglob histappend no_empty_cmd_completion cdspell xpg_echo

function pgd {
  echo -n $(
    git status 2>/dev/null | awk -v out=$1 -v std="dirty" '{ if ($0=="# Changes to be committed:") std = "uncommited"; last=$0 } \
      END{ if(last!="" && last!="nothing to commit (working directory clean)") { if(out!="") print out; else print std } }'
  )
}
function pgb {
  echo -n "$(git branch --no-color 2>/dev/null | awk -v out="$1"\
   '/^*/ { if(out=="") print $2; else print out}')" #'
}
function pgr {
  echo -n "$(git status 2>/dev/null | awk -v out="$1" '/# Your branch is / { if(out=="") print $5; else print out }')" #'
}
function _rvm_curr {
  local rvm=$(rvm current)
  [[ -n "${rvm}" ]] && printf "${rvm##ruby-} "
}
export PS1='($?) \[\033[36m\]$(_rvm_curr)\[\033[0m\]\u@\h:\[\033[33m\]\w\[\033[0m\]$(pgb " ")\[\033[36m\]$(pgb )\[\033[0m\]$(pgr "(")\[\033[35m\]$(pgr )\[\033[0m\]$(pgr ")")\[\033[0m\]$(pgd "[")\[\033[31m\]$(pgd)\[\033[0m\]$(pgd "]")\[\033[1;33m\]>\[\033[0m\]'
