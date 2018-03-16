set nocompatible
let mapleader=" "

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'jnurmine/Zenburn'
call plug#end()


filetype on
filetype plugin indent on  " load filetype specific indent files
                    " like ~/.vim/indent/python.vim
if !exists("g:syntax_on") " guard multiple sets
        syntax enable " syntax highlight based on filetypes
endif
colorscheme desert
set colorcolumn=80
set nowrap
set shiftwidth=4
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " make tab insert spaces instead
set expandtab
set autoindent
set smartindent
set number
set rnu
set showcmd " show the vim command in the bottom right
set cursorline " highlight current line
set hlsearch " highlighted search
set incsearch " search as characters are entered
set history=1000 "increase history of commands from thr default 20
set showmatch " highlight matching [{()}]
set foldenable " enable folding
set foldlevelstart=99 " how many folds open by default
set foldmethod=indent " fold based on indent level (python)
set noswapfile
set fileformat=unix
set list listchars=tab:▷⋅,trail:▷,nbsp:▷ " display char for bad empty spaces
set hidden " switch vim buffers without having to save


" reload .vimrc
nnoremap <leader>rr :source ~/.vimrc<CR>
" open the previously opened file (in the same vim instance)
nnoremap <leader><leader> :e#<CR> 
" turn off highlight from last search
nnoremap <leader>/ :nohlsearch<CR>
" save current session. open with vim -S
nnoremap <leader>S :mksession!<CR>
" need a macro to open/close all folds

"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set sessionoptions-=blank " ignore error windows on :mksession

"let g:syntastic_always_populate_loc_list = 1 " force loading errors in bottom screen
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "w" "
let g:syntastic_loc_list_height = 10
let g:syntastic_stl_format = "[%E{Err: #%e line#%fe}%B{, }%W{Warn: #%w line#%fw}]"

nnoremap <leader>sc :SyntasticCheck <CR> " run syntax checkers on last save
nnoremap <leader>se :Errors<CR> <C-w>j " Open up the Syntastics errors screen
nnoremap <leader>es :lclose<CR> " close the Syntastic errors screen
nnoremap <leader>sr :SyntasticReset<CR> " remove all syntastic msgs on screen


"YouCompleteMe settings
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
