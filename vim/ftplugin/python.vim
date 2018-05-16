" python specific settings
" to load a specific plugin run

set colorcolumn=120
set encoding=utf-8
" make >> and << round indent to 4 (insert mode ctrl-T and D always do this)
set shiftround
colors zenburn
highlight clear SignColumn
highlight clear LineNr
setl nosmartindent " smartindent for python moves #comments to the start of line
highlight MatchParen cterm=bold ctermbg=black ctermfg=white
