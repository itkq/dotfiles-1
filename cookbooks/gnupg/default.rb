%w(gnupg pinentry-mac).each do |pkg|
  package pkg
end

dotfile '.gnupg/gpg-agent.conf'
