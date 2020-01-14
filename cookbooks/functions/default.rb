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
