source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-history-substring-search"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
