" export LIGHTVIM before loading this vimrc for a lighter version of it
set nocompatible " disable compatability with vi
let mapleader=" "

" get vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To install plugins run :PlugInstall
" To update plugins run :PlugUpdate
" To force update plugins (and run the do command) run :PlugUpdate!
" To view status of plugins run :PlugStatus
call plug#begin('~/.vim/bundle')

" searching
"TODO: fuzzy finder ctrl-p or fzf?
Plug 'nelstrom/vim-visual-star-search'
" after a visual selection, press * or # to search for that text

"colors
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

"commands
Plug 'tpope/vim-repeat' " let '.' repeat plugins
Plug 'tpope/vim-commentary' " comment lines
" toggles the comment lines specified.
" gcgc uncomment adjacent commented lines
" [count]gcc to comment count lines
" gc{motion}
" visyal mode then gc to comment it
" :7,17Commentary to comment lines 7-17
" :g/TODO/Commentary global invocation
Plug 'tpope/vim-unimpaired' " :help unimpaired
" #[<spacce> add # lines before (or ] for after) current cursor
" #[e #]e move current line # lines up for down
" =os enable/disable spelling
" =ow enable/disable word wrap
" [y ]y encode/decode c strings (add escape chars,etc)
Plug 'tpope/vim-surround' " :help surround
" opening [ = delete containted whitespace. closing ] dont delete whitespace
" use S instead of s to place the surrounded object on its own line
" cs"' -> change "h" to 'h'
" ysw] -> add [] to text objext w, ys = you surround (according to tpope..)
" yss) -> yss is a special case to work on the whole line
" ds" -> delete surrounding
Plug 'tpope/vim-speeddating'
" use Ctrl-a and ctrl-x to update date stamps correctly

Plug 'AndrewRadev/splitjoin.vim',  {'for': ['c','cpp','python', 'vim', 'sh']}
" This plugin is code syntax aware and will split/join lines accordingly
" gJ - join multiple lines into one
" gS - split one line into multiple


"code completion/semantics
if empty($LIGHTVIM)
    if v:version >= 800
        Plug 'w0rp/ale', {'for': ['python', 'sh']} " ycm does c family
    else
        Plug 'vim-syntastic/syntastic' {'for': ['python', 'sh']}
    endif
endif
if empty($LIGHTVIM)
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer', 'frozen': 1,
    \   'on': 'YcmDiags',
    \   'for': ['c','cpp','python', 'vim', 'sh']}
endif
"TODO: test out the below plugins before enabling in the repo
"Plug 'Raimondi/delimitMate' " insert mode auto completion for quotes,paren,etc.
"Plug 'SirVer/ultisnips' " insert mode code snippets

"ui plugins
Plug 'junegunn/goyo.vim' " :Goyo
Plug 'junegunn/limelight.vim' " :Limelight
let g:limelight_conceal_ctermfg = 'gray'

call plug#end()


" vim settings. use :help <option> for more info
filetype on
filetype plugin indent on
if !exists("g:syntax_on") " guard multiple sets
        syntax enable " syntax highlight based on filetypes
endif
colorscheme solarized
set background=dark
"set colorcolumn=80
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
set list listchars=tab:▷⋅,trail:▷,nbsp:▷ " display char for bad empty spaces
set hidden " switch vim buffers without having to save
set wildmenu " show possible completionons on the commandline
set timeoutlen=1200 " more time for macros
set scrolloff=1 " leave cursor one line below end of screen when scrolling
set sidescrolloff=5
set ruler " show the line and column # of the cursor position
set backspace=indent,eol,start
set formatoptions+=j " Delete comment character when joining commented lines
set autoread " when the file is changed outside the current buffer, reload it
set spelllang=en_us
set ttyfast " enable faster terminal updates
highlight clear SignColumn
highlight clear LineNr

"abbreviations while typying in insert mode
" type xdate to insert current date
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" jk to go back to normal mode
inoremap jk <Esc>
" kj to go back to normal mode and save the file
inoremap kj <Esc>:w!<CR>
" ij to get one normal mode command in insert mode than back to insert
inoremap ij <C-o>

nnoremap <leader>rr :source ~/.vimrc<CR> " reload .vimrc
nnoremap <leader><leader> :e#<CR> " open the previously opened file (in the same vim instance)
nnoremap <leader>/ :nohlsearch<CR> " turn off highlight from last search
nnoremap <leader>S :mksession!<CR> " save current session. open with vim -S
" need a macro to open/close all folds
nnoremap <leader>wd :w<CR>:w! ~/dev/%<CR> " write the current file to ~/dev
nnoremap <leader>wb :w<CR>:w! ~/mbig/%<CR> " write the current file to ~/mbig

augroup CloseLoclistWindowGroup " close location list if its the last file
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

autocmd FileType gitcommit setlocal spell " check spelling in git commits

"
" Ale settings
let g:ale_lint_on_enter = 0 " dont lint on opening file
let g:ale_lint_delay = 500 " ms before linting kicks in while typing
let g:ale_lint_on_text_changed = 'always'
let g:ale_fix_on_save = 0
let g:ale_sign_error = '✗'
let g:ale_sign_style_error = 'S✗'
let g:ale_sign_warning = 'w'
let g:ale_sign_style_warning = 'Sw'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]' " format when cursor over line
let g:ale_loclist_msg_format = '[%linter% %code%] %s [%severity%]' "loclist format
"note that pylint is not async, it requieres data to be on disk
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'sh': ['shellcheck']
\}
let g:ale_fixers = {
\   'python': ['autopep8']
\}

nnoremap <leader>af :ALEFix<CR> " use ale fixers on the file
nnoremap <leader>at :ALEToggle<CR> " turn ale on/off
nnoremap <leader>ae :lopen<CR> " open location list with err/war msgs
nnoremap <leader>ea :lclose<CR> " close location list with err/war msgs
nnoremap <leader>ac :ALEReset<CR> " clean all err/wan msgs
nnoremap ]l :ALENextWrap<CR>
nnoremap [l :ALEPreviousWrap<CR>

"Syntastic settings
" Using ALE instead
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"set sessionoptions-=blank " ignore error windows on :mksession
"
""let g:syntastic_always_populate_loc_list = 1 " force loading errors in bottom screen
""let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_error_symbol = "✗"
"let g:syntastic_warning_symbol = "w" "
"let g:syntastic_loc_list_height = 10
"let g:syntastic_stl_format = "[%E{Err: #%e line#%fe}%B{, }%W{Warn: #%w line#%fw}]"
"
"nnoremap <leader>sc :SyntasticCheck <CR> " run syntax checkers on last save
"nnoremap <leader>se :Errors<CR> <C-w>j " Open up the Syntastics errors screen
"nnoremap <leader>es :lclose<CR> " close the Syntastic errors screen
"nnoremap <leader>sr :SyntasticReset<CR> " remove all syntastic msgs on screen


"YouCompleteMe settings
"g:ycm_disable_for_files_larger_than_kb = 1000 " in kb. default=1000
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_always_populate_location_list = 1 " populates (but doesnt show) loc list
let g:ycm_error_symbol = "✗"
let g:ycm_warning_symbol = "w" "

" :YcmDebugInfo "display ycmd settings and compilation flags
" :YcmCompleter RestartServer /path/to/python3 restart server with optional new binary
nnoremap <leader>yo :YcmDiags<CR> " the plugin is mapped to turn on with this
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> " recompile and show err
nnoremap <leader>yr :YcmForceCompileAndDiagnostics<CR> " recompile and show err
nnoremap <leader>ye :YcmDiags<CR> " display bottom row list of errors
nnoremap <leader>ey :lclose<CR> " close the YCM errors screen
nnoremap <leader>yf :YcmCompleter FixIt<CR> " fix the errors on the current line
nnoremap <leader>yg :YcmCompleter GoTo<CR> " Goto file that defines or implmnt symbl
nnoremap <leader>ygr :YcmCompleter GoToReferences<CR> " find references to symbol
nnoremap <leader>yt :YcmCompleter GetType<CR> " print the type of the variable
nnoremap <leader>yd :YcmCompleter GetDoc<CR> " show docstring
nnoremap <leader>y2 :YcmCompleter RestartServer python2<CR>
nnoremap <leader>y3 :YcmCompleter RestartServer python3<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>

" vim-airline Settings
"let g:airline#extensions#ale#enabled = 1 " display ale messages
