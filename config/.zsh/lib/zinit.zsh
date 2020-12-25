zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
# zinit load zdharma/history-search-multi-word

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
