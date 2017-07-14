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
  local left2="[$last_status]"
  local left3=" $(__current_branch) "
  local right1="[$(date +"%H:%M:%S")]"
  local right2="$vcs_info_msg_0_"

  psvar=()
  psvar[1]="${left1}"
  psvar[2]="${left2}"
  psvar[3]="${left3}"
  psvar[4]="${(r:($COLUMNS-${#left1}-${#left2}-${#left3}-${#right1}):: :)}"
  psvar[5]="${right1}"
  psvar[6]="${right2}"

  if [[ "x$last_status" == "x0" ]]; then
    PROMPT="%F{cyan}%1v%f%2v%3v%4v%F{green}%5v%f
$ "
  else
    PROMPT="%F{cyan}%1v%f%F{red}%2v%f%3v%4v%F{green}%5v%f
$ "
  fi
}
