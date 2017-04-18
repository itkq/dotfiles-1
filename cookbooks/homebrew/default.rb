directory '/opt' do
  user 'root'
  group 'wheel'
end

directory '/opt/brew' do
  user node[:user]
  group 'admin'
end

git '/opt/brew' do
  repository 'https://github.com/Homebrew/brew.git'
  not_if 'test -f /opt/brew/bin/brew'
end
