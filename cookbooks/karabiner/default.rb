node.reverse_merge!(
  macos_major_version: `sw_vers | grep 'ProductVersion' | awk '{print $2}'`.split(".")[1].to_i
)

if node[:macos_major_version] >= 12 # sierra
  install_dmg 'https://pqrs.org/latest/karabiner-elements-latest.dmg' do
    not_cond "[ -e /Applications/Karabiner-Elements.app ]"
  end

  dotfile ".config/karabiner"
end
