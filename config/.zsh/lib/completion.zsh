# use completion
autoload -U compinit
compinit

# select completion by cursor
# zstyle ':completion:*:default' menu select=2

# --opt=*** completion
# setopt magic_equal_subst

# complete / of dir name
setopt auto_param_slash
setopt mark_dirs

# colorize completions
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
# zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
# zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
# zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# group completions
# zstyle ':completion:*' group-name ''

# option separater
# zstyle ':completion:*' list-separator '-->'
# zstyle ':completion:*:manuals' separate-sections true

# colorize completions
autoload colors
colors
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# autoload predict-on
# predict-on

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
