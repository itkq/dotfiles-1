zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
