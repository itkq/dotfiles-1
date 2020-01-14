include_role 'base'

# include_cookbook 'xcode'
include_cookbook 'homebrew'
include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'neovim'
include_cookbook 'zsh'
include_cookbook 'peco'
include_cookbook 'fzf'
include_cookbook 'ag'
include_cookbook 'tmux'
include_cookbook 'gnupg'
include_cookbook 'bin'
include_cookbook 'karabiner'
include_cookbook 'rust'

dotfile '.gemrc'
dotfile '.peco'
dotfile '.pryrc'
dotfile '.psqlrc'
dotfile '.railsrc'
dotfile '.rake'
dotfile '.tigrc'
dotfile '.globalrc'

dotfile '.iterm2'
dotfile 'Library/Application Support/Code/User/settings.json' do
  source 'vscode/settings.json'
end
dotfile 'Library/Application Support/Code/User/keybindings.json' do
  source 'vscode/keybindings.json'
end
