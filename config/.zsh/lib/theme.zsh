autoload -Uz vcs_info

function __current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

precmd() {
  local last_status="$?"
  LANG=en_US.UTF-8 vcs_info

  local left1="$(pwd | sed -e "s#$HOME#~#") "
  if [ -z "$(__current_branch)" ]; then
    local left2=""
  else
    local left2="[$(__current_branch)] "
  fi
  local right1="$(date +"%H:%M") "
  local right2="$vcs_info_msg_0_"

  psvar=()
  psvar[1]="${left1}"
  psvar[2]="${left2}"
  psvar[3]="${(r:($COLUMNS-${#left1}-${#left2}-${#right1}):: :)}"
  psvar[4]="${right1}"
  psvar[5]="${right2}"

  if [[ "x$last_status" == "x0" ]]; then
    PROMPT="%F{blue}%4v%F{cyan}%1v%f%2v%3v
%F{green}$%f "
  else
    PROMPT="%F{blue}%4v%F{cyan}%1v%f%2v%3v
%F{red}$%f "
  fi
}
