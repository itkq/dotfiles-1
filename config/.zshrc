function profile() {
    START_TIME=`~/bin/unixnano`
		source $1
    END_TIME=`~/bin/unixnano`

    TIME=`expr ${END_TIME} - ${START_TIME}`
    SEC=`expr $TIME / 1000000000`
    USEC=`expr $TIME % 1000000000`
    echo "${SEC}.`printf '%09d' $USEC`: $1"
}

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

unsetopt BEEP
bindkey -e

source ~/.zinit/bin/zinit.zsh
source ~/.zsh/lib/go.zsh
source ~/.zsh/lib/aliases.zsh
source ~/.zsh/lib/basic.zsh
source ~/.zsh/lib/completion.zsh
source ~/.zsh/lib/functions.zsh
source ~/.zsh/lib/git.zsh
source ~/.zsh/lib/languages.zsh
source ~/.zsh/lib/peco.zsh
source ~/.zsh/lib/ruby.zsh
source ~/.zsh/lib/python.zsh
source ~/.zsh/lib/theme.zsh
source ~/.zsh/lib/tmux.zsh
source ~/.zsh/lib/bundle.zsh
source ~/.zsh/lib/k8s.zsh
source ~/.zsh/lib/gcloud.zsh
source ~/.zsh/lib/zinit.zsh

# Environment-local configurations
[ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`
[ -f ~/.zshrc.local ]   && source ~/.zshrc.local

# Cookpad
[ -f ~/.zshrc.ckpd ] && source ~/.zshrc.ckpd

export NVM_DIR="/Users/itkq/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
