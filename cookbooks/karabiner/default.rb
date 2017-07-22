node.reverse_merge!(
  macos_major_version: `sw_vers | grep 'ProductVersion' | awk '{print $2}'`.split(".")[1].to_i
)

if node[:macos_major_version] >= 12 # sierra
  install_dmg 'https://pqrs.org/latest/karabiner-elements-latest.dmg' do
    not_cond "[ -e /Applications/Karabiner-Elements.app ]"
  end

  execute 'brew tap jlhonora/lsusb' do
    not_if 'brew tap | grep jlhonora/lsusb'
  end

  package 'jlhonora/lsusb/lsusb'

  dotfile ".config/karabiner"
end
