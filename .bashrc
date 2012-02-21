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

shopt -s promptvars dotglob histappend no_empty_cmd_completion cdspell xpg_echo

source ~/.shrc

export PS1='($?) \[\033[36m\]$(_rvm_curr)\[\033[0m\]\u@\h:\[\033[33m\]\w\[\033[0m\]$(pgb " ")\[\033[36m\]$(pgb )\[\033[0m\]$(pgr "(")\[\033[35m\]$(pgr )\[\033[0m\]$(pgr ")")\[\033[0m\]$(pgd "[")\[\033[31m\]$(pgd)\[\033[0m\]$(pgd "]")\[\033[1;33m\]>\[\033[0m\]'

export BUNDLER_BLACKLIST="gist rake"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
