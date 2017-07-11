package 'tmux'
dotfile '.tmux.conf'
dotfile '.tmux.conf.local' do
  source ".tmux.conf.#{node[:platform].downcase}"
end

git_clone 'https://github.com/tmux-plugins/tpm' do
  dest '~/.tmux/plugins/tpm'
end

if node[:platform] == 'darwin'
  package 'reattach-to-user-namespace'
elsif node[:platform] == 'arch'
  package 'xclip'
end
