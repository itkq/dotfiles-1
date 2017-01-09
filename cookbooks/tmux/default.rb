package 'tmux'
package 'xclip'

dotfile '.tmux.conf'

execute 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm' do
  not_if 'test -e ~/.tmux/plugins/tpm/'
end

execute 'git clone https://github.com/erikw/tmux-powerline.git ~/tmux-powerline' do
  not_if 'test -e ~/tmux-powerline/'
  user node[:user]
end

dotfile '.tmux-powerlinerc'
