" to load a specific plugin run

" dont run if its a cpp file
" https://stackoverflow.com/questions/21339177/vim-ftplugin-executes-c-vim-instead-of-cpp-vim-for-c-files
if (&ft != 'c')
    finish
endif

" Default compilation file for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf_c.py'

set colorcolumn=80
"set encoding=utf-8
colors zenburn
highlight clear SignColumn
highlight clear LineNr
