# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mpapis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.shrc

setopt prompt_subst
export PS1='(%?) %F{cyan}$(_rvm_curr)%F{default}%n@%m:%F{yellow}%d%F{default}$(pgb " ")%F{cyan}$(pgb )%F{default}$(pgr "(")%F{blue}$(pgr )%F{default}$(pgr ")")$(pgd "[")%F{red}$(pgd)%F{default}$(pgd "]")%F{yellow}>%F{default}'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
