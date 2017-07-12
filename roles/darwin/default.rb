node.reverse_merge!(
  macos_major_version: `sw_vers | grep 'ProductVersion' | awk '{print $2}'`.split(".")[1].to_i
)

include_role 'base'

include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'zsh'
include_cookbook 'ghq'
include_cookbook 'peco'
include_cookbook 'fzf'
include_cookbook 'ag'
include_cookbook 'thunderbolt'
include_cookbook 'go'
include_cookbook 'tmux'

dotfile '.gemrc'
dotfile '.karabiner'
dotfile '.peco'
dotfile '.pryrc'
dotfile '.psqlrc'
dotfile '.railsrc'
dotfile '.rake'

if node[:macos_major_version] >= 12 # sierra
  dotfile '.config/karabiner/karabiner.json' do
    source 'karabiner.json'
  end
end
