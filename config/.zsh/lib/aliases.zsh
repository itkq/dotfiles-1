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
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# cd by dir name only for ..
alias ..="cd .."

alias l=ll
alias lll=ll

# which nvim > /dev/null && alias vim=nvim && export EDITOR=nvim

function mkcd() {
  mkdir $1
  cd $1
}

which pget > /dev/null && alias wget=pget
alias d="direnv allow"
alias de="direnv edit"

alias k="kubectl"

alias l="ls -l"
alias ll="ls -l"
alias lll="ls -l"
