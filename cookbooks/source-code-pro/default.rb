git_clone 'https://github.com/powerline/fonts' do
  dest '/tmp/powerline_fonts'
end

execute 'Install source code pro (powerline patched)' do
  command 'cp /tmp/powerline_fonts/SourceCodePro/*.otf /Library/Fonts'
  user 'root'
  not_if "ls /Library/Fonts | grep -q 'Source Code Pro'"
end
