let mapleader=" "

" text color/fonts

" syntax highlight based on filetypes
filetype on 
filetype indent on  " load filetype specific indent files
                    " like ~/.vim/indent/python.vim
if !exists("g:syntax_on") " guard multiple sets
        syntax enable
endif
colorscheme desert
set colorcolumn=80
set nowrap
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number os dpaces in tab when editing
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
set foldlevelstart=0 " close all folds by default
set foldmethod=indent " fold based on indent level (python)


" reload .vimrc
map <leader>s :source ~/.vimrc<CR>
" cancel a search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" open the previously opened file (in the same vim instance)
nnoremap <leader><leader> :e#<CR> 
" turn off highlight from last search
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>S :mksession!<CR> " save current session. open with vim -S
" need a macro to open/close all folds
