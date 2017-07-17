include_cookbook 'vim'

package 'neovim'

execute "pip3 install neovim" do
  not_if 'pip3 list --format=columns | grep pip >/dev/null'
end

directory "#{ENV['HOME']}/.local/share/nvim/site" do
  user node[:user]
end

link "#{ENV['HOME']}/.local/share/nvim/site/spell" do
  to "/usr/share/vim/vim74/spell"
end

dotfile '.config/nvim'
