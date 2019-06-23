export projects_path="$HOME/projects"

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" || true
# source ~/.profile

if
  [[ -x /usr/bin/fortune ]]
then
  /usr/bin/fortune
  echo
fi

__setup_ssh_agent
[[ -n "${DISPLAY:-}" ]] || __setup_gpg_agent

if
   [[ -s "${rvm_path:-$HOME/.rvm}/scripts/rvm" ]]
then
  unset rvm
  source "${rvm_path:-$HOME/.rvm}/scripts/rvm" # Load RVM into a shell session *as a function*
else
  function rvm()
  {
    echo "no rvm"
  }
fi

for script in "${sm_path:-/opt/sm/}/core/sm/shell/project/interactive" "${rvm_path:-$HOME/.rvm}/scripts/completion" "$HOME/projects/owned/privatecd/privatecd.sh"
do
  [[ -s "$script" ]] && source "$script" || true
done

path_cleanup
