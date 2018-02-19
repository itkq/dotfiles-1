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

# for uplus/deoplete-solargrah
execute 'gem install solargraph' do
  not_if 'gem list | grep -q solargraph'
end

execute 'pip install solargraph-utils.py --user' do
  not_if 'pip list --format=columns | grep -q solargraph-utils'
end

execute 'yard gems'

dotfile '.config/nvim'
