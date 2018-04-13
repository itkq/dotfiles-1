package 'gpg2' do
  not_if 'which gpg > /dev/null'
end
package 'gpg-agent' do
  notifies :create, 'file[~/.gnupg/gpg-agent.conf]'
end
package 'pinentry-mac'


file "#{ENV['HOME']}/.gnupg/gpg-agent.conf" do
  action :nothing
  content <<EOS
use-standard-socket
pinentry-program /usr/local/bin/pinentry-mac
EOS
end
