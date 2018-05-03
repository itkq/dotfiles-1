node.reverse_merge!(
  os: run_command('uname').stdout.strip.downcase,
)

define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    user node[:user]
    force true
  end
end

define :github_binary, repository: nil, binary_path: "#{ENV['HOME']}/bin" do
  repository = params[:name] || params[:repository]
  cmd = repository.split('/')[-1]

  execute "Download binary from #{repository}" do
    not_if "test -e #{params[:binary_path].sub(/\/$/, '')}/#{cmd}"
    command <<EOF
set -Cue

repos=#{repository}
bin_path=#{params[:binary_path]}
os=#{node[:os]}

cmd=#{cmd}
release_url=$(curl -sSL https://api.github.com/repos/$repos/releases/latest \
  | grep browser_download_url | grep -i $os | egrep -i "amd64|x86_64" | awk -F'"' '{print $4}')
tmp_path=/tmp/$(basename $release_url)

curl -fSL -o $tmp_path $release_url && case $(file --mime-type $tmp_path | cut -d' ' -f2) in
  "application/zip")
    dst=$(echo $tmp_path | sed 's/\.[^\.]*$//')
    unzip -o $tmp_path -d $dst
    if [ -d $dst ]; then
      tmp_path="$(find $dst -name "$cmd" | head -n 1)"
    else
      tmp_path="$(echo $tmp_path | sed 's/\.[^\.]*$//')/$cmd"
    fi
    mv $tmp_path "${bin_path%/}/$cmd" && chmod u+x "${bin_path%/}/$cmd"
    ;;
  "application/x-gzip" | "application/x-tar")
    dst=$(echo $tmp_path | sed 's/\.tar\.gz$//')
    tar xzf $tmp_path -C /tmp
    if [ -d $dst ]; then
      tmp_path="$(find $dst -name "$cmd" | head -n 1)"
    else
      tmp_path="$(echo $tmp_path | sed 's/\.[^\.]*$//')/$cmd"
    fi
    mv $tmp_path "${bin_path%/}/$cmd" && chmod u+x "${bin_path%/}/$cmd"
    ;;
  "application/x-mach-binary" | "application/octet-stream")
    mv $tmp_path "${bin_path%/}/$cmd" \
      && chmod u+x "${bin_path%/}/$cmd"
    ;;
esac
EOF
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
