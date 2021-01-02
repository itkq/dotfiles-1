package 'zsh'

case node[:platform]
when 'wsl'
  dotfile '.zshrc.Linux'
  dotfile '.zshrc.wsl'
when 'darwin'
  dotfile '.zshrc.darwin'
else
  dotfile '.zshrc.Linux'
end

dotfile '.zsh'
dotfile '.zshrc'

execute "chsh -s /bin/zsh #{node[:user]}" do
  only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '^/bin/bash$'"
  # user 'root'
end

execute 'Install zinit' do
  command 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"'
  not_if 'test -d ~/.zinit'
end
