include_recipe 'recipe_helper'

node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER'],
)

if ENV['WSL_DISTRO_NAME']
  platform, platform_version = ENV['WSL_DISTRO_NAME'].split('-').map(&:downcase)
  node[:platform] = "wsl2-#{platform}"
  node[:platform_version] = platform_version
end

include_role node[:platform]
