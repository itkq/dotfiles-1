execute "xcode-select --install" do
  user 'root'
  not_if '[ -d /Applications/Xcode.app ]'
end
