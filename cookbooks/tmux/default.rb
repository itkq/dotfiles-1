package 'tmux'
package 'xclip'

dotfile '.tmux.conf'

git '~/.tmux/plugins/tpm' do
  repository 'https://github.com/tmux-plugins/tpm.git'
  not_if 'test -e ~/.tmux/plugins/tpm/'
end

git '~/tmux-powerline' do
  repository 'https://github.com/erikw/tmux-powerline.git'
  not_if 'test -e ~/tmux-powerline/'
end

dotfile '.tmux-powerlinerc'
