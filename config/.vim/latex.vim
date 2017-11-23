let g:vimtex_disable_version_warning = 1
let g:Tex_ViewRule_pdf = 'open -ga /Applications/Skim.app'


" LaTeX Quickrun
let g:quickrun_config['tex'] = {
\   'exec': '%c %s',
\   'command' : 'latexmk_wrapper',
\}

autocmd BufWritePost *.tex :QuickRun tex
