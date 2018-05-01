package 'gpg2' do
  not_if 'which gpg > /dev/null'
end

%w(pinentry-mac gpg-agent).each do |pkg|
  package pkg
end

dotfile '.gnupg/gpg-agent.conf'
