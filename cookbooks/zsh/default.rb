if node[:platform] != 'darwin'
  package 'zsh'
  dotfile '.zshrc.Linux'
else
  dotfile '.zshrc.darwin'
end

dotfile '.zsh'
dotfile '.zshrc'

execute "chsh -s /bin/zsh #{node[:user]}" do
  only_if "getent passwd #{node[:user]} | cut -d: -f7 | grep -q '^/bin/bash$'"
  # user 'root'
end

execute 'Install zplug' do
  command 'curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh'
  not_if 'test -d ~/.zplug'
end
