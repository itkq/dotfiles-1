pinger_version = '1.1'
github_binary 'pinger' do
  repository 'hirose31/pinger'
  version "v#{pinger_version}"
  archive "pinger-#{pinger_version}_#{node[:os]}_amd64.zip"
  binary_path "pinger-#{pinger_version}_#{node[:os]}_amd64/pinger"
end

pet_version = '0.2.3'
github_binary 'pet' do
  repository 'knqyf263/pet'
  version "v#{pet_version}"
  archive "pet_#{pet_version}_#{node[:os]}_amd64.zip"
end
