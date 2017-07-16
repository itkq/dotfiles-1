node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase,
)

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    user node[:user]
  end
end

define :github_binary, version: nil, repository: nil, archive: nil, binary_path: nil do
  cmd = params[:name]
  bin_path = "#{ENV['HOME']}/bin/#{cmd}"
  archive = params[:archive]
  url = "https://github.com/#{params[:repository]}/releases/download/#{params[:version]}/#{archive}"

  if archive.end_with?('.zip')
    extract = "unzip -o"
  elsif archive.end_with?('.tar.gz')
    extract = "tar xvzf"
  else
    raise "unexpected ext archive: #{archive}"
  end

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin_path}"
  end
  execute "#{extract} /tmp/#{archive}" do
    not_if "test -f #{bin_path}"
    cwd "/tmp"
  end
  execute "mv /tmp/#{params[:binary_path] || cmd} #{bin_path} && chmod +x #{path}" do
    not_if "test -f #{bin_path}"
  end
end

define :user_service, action: [] do
  name = params[:name]

  Array(params[:action]).each do |action|
    case action
    when :enable
      execute "sudo -E -u #{node[:user]} systemctl --user enable #{name}" do
        not_if "sudo -E -u #{node[:user]} systemctl --user --quiet is-enabled #{name}"
      end
    when :start
      execute "sudo -E -u #{node[:user]} systemctl --user start #{name}" do
        not_if "sudo -E -u #{node[:user]} systemctl --user --quiet is-active #{name}"
      end
    end
  end
end

define :git_clone, source: nil, dest: nil, not_cond: nil do
  source = params[:source] || params[:name]
  dest = params[:dest]
  cond = params[:not_cond] ? " || #{params[:not_cond]}" : ""
  execute "git clone" do
    command "git clone #{source} #{dest}"
    user node[:user]
    not_if "test -d #{dest} #{cond}"
  end
end

define :ghq, source: nil, ssh: nil do
  source = params[:source] || params[:name]
  execute "ghq get #{source} #{params[:ssh] ? '-p' : ''}" do
    user node[:user]
    not_if "ghq list | grep -q #{source}"
  end
end

define :install_dmg, source: nil, not_cond: nil do
  source = params[:source] || params[:name]
  sha1 = `echo #{source} | openssl sha1`.strip
  filepath = "/tmp/#{sha1}.dmg"

  execute "curl -fSL -o #{filepath} #{source}" do
    not_if "#{params[:not_cond]} || [ -f #{filepath}]"
  end

  target_dir_file = "/tmp/#{sha1}_dir"
  execute "hdiutil attach #{filepath} | awk -F '\t' 'END{print $NF}' > #{target_dir_file}" do
    user 'root'
    only_if "test -f #{filepath}"
  end

  execute "install dmg with pkg" do
    command "installer -pkg $(cat #{target_dir_file})/$(ls $(cat #{target_dir_file}) | tail -n1) -target /"
    user 'root'
    only_if "a=$(ls $(cat #{target_dir_file}) | tail -n1) && [ ${a##*.} = 'pkg' ]"
    notifies :nothing, "execute[Cleanup]"
  end

  execute "Cleanup" do
    command "hdiutil detach $(cat #{target_dir_file}) && rm #{filepath} #{target_dir_file}"
    only_if "test -f #{target_dir_file}"
    user 'root'
  end

end
