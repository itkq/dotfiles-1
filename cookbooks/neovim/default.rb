include_cookbook 'vim'

package 'neovim'

execute "pip3 install neovim" do
  not_if 'pip3 list --format=columns | grep pip >/dev/null'
end

dotfile '.config/nvim'
