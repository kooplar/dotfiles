execute pathogen#infect()
" to only load specific packages comment the above and for each plugin do:
" execute pathogen#interpose('bundle/unicode.vim')

let mapleader=" "

filetype on
filetype indent on  " load filetype specific indent files
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


" reload .vimrc
map <leader>s :source ~/.vimrc<CR>
" cancel a previous searches highlights
nnoremap <leader><Esc> :nohlsearch<Bar>:echo<CR>
" open the previously opened file (in the same vim instance)
nnoremap <leader><leader> :e#<CR> 
" turn off highlight from last search
nnoremap <leader>/ :nohlsearch<CR>
" save current session. open with vim -S
nnoremap <leader>S :mksession!<CR>
" need a macro to open/close all folds
