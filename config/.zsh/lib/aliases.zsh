# .zshrc reload
alias re="source ~/.zshrc"

# vim
function vi() {
  vim ${=*/:/ +}
}

# Prefer brew's vim
export PATH="/opt/brew/bin:/usr/local/bin:${PATH}"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


function mkcd() {
  mkdir $1
  cd $1
}

alias d="direnv allow"
alias de="direnv edit"

alias k="kubectl"

if [[ $(uname) -eq "Darwin" ]]; then
  alias ll="ls -l"
else
  alias ll="ls -l --color=auto"
fi

alias l=ll
alias lll=ll
