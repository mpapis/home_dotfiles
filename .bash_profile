export projects_path="$HOME/projects"

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" || true

if [[ -x /usr/bin/fortune ]]
then
  /usr/bin/fortune
  echo
fi

__setup_ssh_agent

[[ -s "/opt/sm/core/sm/shell/project/interactive" ]] && source "/opt/sm/core/sm/shell/project/interactive"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
