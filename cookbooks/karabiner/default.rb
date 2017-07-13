node.reverse_merge!(
  macos_major_version: `sw_vers | grep 'ProductVersion' | awk '{print $2}'`.split(".")[1].to_i
)

if node[:macos_major_version] >= 12 # sierra
  install_dmg 'https://pqrs.org/latest/karabiner-elements-latest.dmg'

  directory "#{ENV['HOME']}/.config/karabiner" do
    owner node[:user]
  end

  dotfile '.config/karabiner/karabiner.json' do
    source 'karabiner.json'
  end
end
