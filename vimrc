" IDEVIM=y before loading this vimrc to load ide like plugins
" PLUGIN=n before loadng this vimrc to not load any plugins
set nocompatible " disable compatibility with vi
let mapleader=" "
let maplocalleader=" "

" vim settings. use :help <option> for more info
filetype on
filetype plugin indent on
syntax enable " syntax highlight based on filetypes
set background=dark
colorscheme solarized " its a plugin but we also copy it to vim/colors
set nowrap
set shiftwidth=4
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " make tab insert spaces instead
set autoindent
set number
set rnu
set showcmd " show the vim command in the bottom right
set cursorline " highlight current line
set hlsearch " highlighted search
set incsearch " search as characters are entered
set history=1000 "increase history of commands from the default 20
set showmatch " highlight matching [{()}]
set foldenable " enable folding
set foldlevelstart=99 " how many folds open by default
set foldmethod=syntax
set noswapfile
set fileformat=unix
" set list listchars=tab:▷⋅,trail:▷,nbsp:▷ " display char for bad empty spaces
set list listchars=tab:>~,trail:>,nbsp:> " display char for bad empty spaces
set hidden " switch vim buffers without having to save
set wildmenu " show possible completions on the commandline
set wildmode=longest:full,full
set timeoutlen=1200 " more time for macros
set scrolloff=1 " leave cursor one line below end of screen when scrolling
set sidescrolloff=5
set ruler " show the line and column # of the cursor position
set backspace=indent,eol,start
set formatoptions+=j " Delete comment character when joining commented lines
set autoread " when the file is changed outside the current buffer, reload it
set spelllang=en_us
set ttyfast " enable faster terminal updates
set smartcase " lowercase  matches upper also, but upper only matches upper
set infercase " in insert completion mode (ctrlx) use smartcase like matching

runtime macros/matchit.vim " ships with vim, but needs to be enabled

"abbreviations while typing in insert mode
" type xdate to insert current date
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab chnage change
iab chnages changes

" jk to go back to normal mode
inoremap jk <Esc>
" kj to go back to normal mode and save the file
inoremap kj <Esc>:w!<CR>
" ij to get one normal mode command in insert mode than back to insert
inoremap ij <C-o>

" make normal mode & copy the previous flags used
nnoremap & :&&<CR>
xnoremap & :&&<CR>

nnoremap <leader>rr :source ~/.vimrc<CR>" reload .vimrc
nnoremap <leader><leader> <c-^>" open the previously opened file (in the same vim instance)
nnoremap <leader>/ :nohlsearch<CR>" turn off highlight from last search
nnoremap <leader>S :mksession!<CR>" save current session. open with vim -S
" need a macro to open/close all folds
nnoremap <leader>wd :w<CR>:w! ~/dev/%<CR>" write the current file to ~/dev
nnoremap <leader>wb :w<CR>:w! ~/mbig/%<CR>" write the current file to ~/mbig

" type %% in ex commands to expand the current buffers full directory
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

augroup CloseLoclistWindowGroup " close location list if its the last file
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

autocmd FileType gitcommit setlocal spell " check spelling in git commits

" netrw settings
let g:netrw_winsize = 25

if empty($PLUGVIM)
    source ~/.vimrc_plugins
endif

highlight clear SignColumn
highlight clear LineNr
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight MatchParen cterm=bold ctermbg=black ctermfg=white

"plugin/function ideas
"TODO: put the above color settings in a function, then set an autocommand
" on the event ColorScheme call it. THis is because when changing colors,
" it the left side sign column doesn't update correctly

"TODO: function to diff current buffer vs current buffer - last change
" Ideally it would bring up a vimdiff type of ui. This would be useful to
" easily see what a big change did

"TODO: autocommand when reading from stdin (vim -), call :AnsiEsc.
"" we can use StdinReadPost event
