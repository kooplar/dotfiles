set nocompatible
let mapleader=" "

" get vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To update/install plugins run :PlugUpdate
" To force update/install plugins (and run the do command) run :PlugUpdate!
" To view status of plugins run :PlugStatus
call plug#begin('~/.vim/bundle')
"colors
Plug 'jnurmine/Zenburn'
"code completion/semantics
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',
            \'for': ['c','cpp','python', 'vim']}
"ui plugins
Plug 'junegunn/goyo.vim' " :Goyo
Plug 'junegunn/limelight.vim' " :Limelight
let g:limelight_conceal_ctermfg = 'gray'
call plug#end()


filetype on
filetype plugin indent on  " load filetype specific indent files
                    " like ~/.vim/indent/python.vim
if !exists("g:syntax_on") " guard multiple sets
        syntax enable " syntax highlight based on filetypes
endif
colorscheme desert
"set colorcolumn=80
set nowrap
set shiftwidth=4
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " make tab insert spaces instead
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

inoremap jk <Esc> " jk = esc
"nnoremap <leader>rr :source ~/.vimrc<CR> " reload .vimrc
nnoremap <leader><leader> :e#<CR> " open the previously opened file (in the same vim instance)
nnoremap <leader>/ :nohlsearch<CR> " turn off highlight from last search
nnoremap <leader>S :mksession!<CR> " save current session. open with vim -S
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

" :YcmDebugInfo "display ycmd settings and compilation flags
" :YcmCompleter RestartServer /path/to/python3 restart server with optional new binary
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> " recompile and show err
nnoremap <leader>yr :YcmForceCompileAndDiagnostics<CR> " recompile and show err
nnoremap <leader>ye :YcmDiags<CR> " display bottom row list of errors
nnoremap <leader>ey :lclose<CR> " close the YCM errors screen
nnoremap <leader>yf :YcmCompleter FixIt<CR> " fix the errors on the current line
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>ygr :YcmCompleter GoToReferences<CR> " find references to symbol
nnoremap <leader>yt :YcmCompleter GetType<CR> " print the type of the variable
nnoremap <leader>yd :YcmCompleter GetDoc<CR> " show docstring
nnoremap <leader>y2 :YcmCompleter RestartServer python2 "not tested yet
nnoremap <leader>y3 :YcmCompleter RestartServer python3 "not tested yet
