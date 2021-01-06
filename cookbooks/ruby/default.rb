if node[:platform] != 'darwin'
  raise 'Not yet implemented'
end

package 'rbenv'

dotfile '.gemrc'
dotfile '.pryrc'
dotfile '.railsrc'
