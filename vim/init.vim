set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-local-vimrc'

" CSV
Plug 'chrisbra/csv.vim'

" dockerfile syntax highlighting
Plug 'honza/dockerfile.vim'

Plug 'majutsushi/tagbar'
" File tree
Plug 'scrooloose/nerdtree'
" Fuzzy file/mru/buffer search
Plug 'kien/ctrlp.vim'
" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Surround with / select between plugin
Plug 'tpope/vim-surround'
" Status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Dash support
Plug 'rizzatti/dash.vim'

" Search about everything
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'davidoc/taskpaper.vim'

" Color schemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Indentation help
Plug 'nathanaelkane/vim-indent-guides'

" Bracket and other delimiters automatic closing
Plug 'Raimondi/delimitMate'

" Debugger
Plug 'joonty/vdebug'

" Syntax checker
Plug 'scrooloose/syntastic'
Plug 'pmsorhaindo/syntastic-local-eslint.vim'

" Completion
" Plug 'Valloric/YouCompleteMe', {'do' : './install.py --clang-completer'}
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Search
Plug 'mileszs/ack.vim'

"Distraction-free editation
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'aklt/plantuml-syntax'

Plug 'SirVer/ultisnips'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

"CSS
Plug 'groenewege/vim-less'

" Scala
Plug 'derekwyatt/vim-scala'
" Plug 'file:///Users/mph/Devel/forked/sbt-quickfix', {'rtp': 'src/main/resources/vim-sbt/'}
Plug 'GEverding/vim-hocon'
Plug 'ensime/ensime-vim'

" Play
Plug 'gre/play2vim'

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'carlitux/deoplete-ternjs'

" PHP
Plug 'vim-php/tagbar-phpctags.vim'

" Objective-C
Plug 'b4winckler/vim-objc'

" Mustache
Plug 'mustache/vim-mustache-handlebars'

" Cucumber tests
Plug 'tpope/vim-cucumber'

" Tables
Plug 'dhruvasagar/vim-table-mode'

" Rust
Plug 'rust-lang/rust.vim'

" Pug
Plug 'digitaltoad/vim-pug'

" Go
Plug 'fatih/vim-go'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"============================================================================
" Make :help appear in a full-screen tab, instead of a window
"============================================================================

    "Only apply to .txt files...
"    augroup HelpInTabs
"        autocmd!
"        autocmd BufEnter  *.txt   call HelpInNewTab()
"    augroup END
"
"    "Only apply to help files...
"    function! HelpInNewTab ()
"        if &buftype == 'help'
"            "Convert the help window to a tab...
"            execute "normal \<C-W>T"
"        endif
"    endfunction

"============================================================================
" Allow deletes in Insert mode to keep deleting past the insertion point
"============================================================================

    set backspace=indent,eol,start

"============================================================================
" Turn on case-insensitive matches (but only when pattern is all-lowercase)
"============================================================================

    set ignorecase smartcase


"============================================================================
" Make searches look-ahead as you type
"============================================================================

    set incsearch


"============================================================================
" Make successful searches highlight all possible matches
"============================================================================

    set hlsearch

"============================================================================
" Make delete key in Normal mode remove the persistently highlighted matches
"============================================================================

    nmap <silent>  <BS>  :nohlsearch<CR>

"============================================================================
" When completing, show all options, insert common prefix, then iterate
"============================================================================

    set wildmode=list:longest,full

"============================================================================
" Make shift operations in Visual mode stay in Visual mode afterwards
"============================================================================

"    vmap <expr> > ShiftAndKeepVisualSelection(">")
"    vmap <expr> < ShiftAndKeepVisualSelection("<")
"
"    function! ShiftAndKeepVisualSelection(cmd, mode)
"        set nosmartindent
"        if mode() =~ '[Vv]'
"            return a:cmd . ":set smartindent\<CR>gv"
"        else
"            return a:cmd . ":set smartindent\<CR>"
"        endif
"    endfunction

" keep always a few lines above/below cursor to see some context
set scrolloff=7

" show ruler
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
    set undolevels=5000
catch
endtry

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" NERDTree
noremap <silent> <D-1> :NERDTreeToggle<CR>
noremap <silent> <Leader>1 :NERDTreeToggle<CR>
noremap <silent> <Leader>ff :NERDTreeFind<CR>

" Tagbar
noremap <silent> <D-7> :TagbarToggle<CR>
noremap <silent> <Leader>7 :TagbarToggle<CR>

colorscheme solarized

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_scala_checkers = ['ensime']
let g:syntastic_ignore_files = ['\m\c\.h$', '\m\.sbt$']

" Do not limit ctrlp max files
let g:ctrlp_max_files=40000

" Map ctrlp for file, buffer and mru search
map <silent> <Leader>t <C-p>
map <silent> <Leader>o :CtrlP .<CR>
map <silent> <Leader>y :CtrlPBuffer<CR>
map <silent> <Leader>e :CtrlPMRU<CR>

" Taskpaper settings
function! s:taskpaper_setup()
" Your settings
nnoremap <buffer> <silent> <Leader>tn
\    :<C-u>call taskpaper#toggle_tag('next', '')<CR>
endfunction

augroup vimrc-taskpaper
autocmd!
autocmd FileType taskpaper call s:taskpaper_setup()
augroup END

" Eclim settings
let g:EclimCompletionMethod = 'omnifunc'

set exrc
set secure

" Dash settings

nmap <silent> <Leader>d <Plug>DashSearch

" Set czech utf-8 keymap
set keymap=czech_utf-8
" Set the iminsert back to 0 after setting the keymap, so that US keyboard is default
" Can be switched with C-^
set iminsert=0
" Use the same flag for search pattern keymap as for insert mode, otherwise they would be separate
set imsearch=-1

" Use markdown format for plain text files
augroup markdown
    autocmd!
    autocmd FileType markdown nmap <buffer> <Leader>p :!open -a Marked\ 2 "%"<CR>
augroup END

" Settings for YML
augroup yml
    autocmd!
    autocmd BufEnter,BufRead *.yml set sts=2 sw=2 et
augroup END

" Remap ultisnips
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>""

" Auto save when moving to another buffer, calling make etc.
set autowrite

" Set silent make on <leader>m
nnoremap <Leader>m :silent make<CR>
inoremap <Leader>m <Esc>:silent make<CR>
vnoremap <Leader>m :<C-U>:silent make<CR>

" Allow line numbers
set number

" Enable jsx checking using jsxhint
" Use 'npm install -g jsxhint' to install
let g:syntastic_javascript_checkers = ['eslint']

" SBT quickfix
let g:quickfix_load_mapping="<Leader>0"
let g:quickfix_next_mapping=""

" Copy to clipboard also (unnamed works for macvim, unnamedplus works with X-11 vim on MacOS)
set clipboard^=unnamed

" Enable powerline symbols
let g:airline_powerline_fonts=1
let g:airline_theme="solarized"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala = '[^. *\t]\.\w*'

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#mappings#close_popup() . "\<CR>"
endfunction

" automatically strip trailing spaces
augroup tspaces
  autocmd!
  autocmd FileType xml,c,cpp,java,scala,php,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END

" ensime mappings
augroup ensime
  autocmd!
  autocmd FileType scala nnoremap <localleader>i :EnSuggestImport<CR>
  autocmd FileType scala nnoremap <localleader>c :EnTypeCheck<CR>
  autocmd FileType scala nnoremap <localleader>dt :EnType<CR>
  autocmd FileType scala nnoremap <localleader>di :EnInspectType<CR>
  autocmd FileType scala nnoremap <localleader>df :EnDeclaration<CR>
  autocmd FileType scala nnoremap <localleader>db :EnDocBrowse<CR>
  autocmd BufWritePost *.scala :silent EnTypeCheck<CR>
augroup end

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

try
  source ~/.config/nvim/init.local.vim
catch
endtry
