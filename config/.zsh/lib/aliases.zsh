# override system ctags
# alias ctags="/usr/local/bin/ctags"

# .zshrc reload
alias re="source ~/.zshrc"

# vim
function vi() {
  vim ${=*/:/ +}
}

# Prefer brew's vim
export PATH="/opt/brew/bin:/usr/local/bin:${PATH}"

# cd by dir name only for ..
alias ..="cd .."

which nvim > /dev/null && alias vim=nvim && export EDITOR=nvim

function mkcd() {
  mkdir $1
  cd $1
}

which pget > /dev/null && alias wget=pget
