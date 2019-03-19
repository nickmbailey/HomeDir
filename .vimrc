"""""""""""""""""""" GENERAL """""""""""""""""""""
set tabpagemax=30
set nocompatible                " don't be compatible with old versions, thats dumb
let mapleader = ","             " better leader key
let maplocalleader = ","        " local leader too

" Set up Vundle
filetype off                    " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" add fzf to rtp
set rtp+=/usr/local/opt/fzf
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Additional plugins
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'fs111/pydoc.vim'
Plugin 'vim-scripts/pylint.vim'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/paredit.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'takac/vim-hardtime'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'kien/ctrlp.vim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'venantius/vim-eastwood'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'trevordmiller/nova-vim'
Plugin 'aclaimant/syntastic-joker'
Plugin 'guns/vim-slamhound'
Plugin 'https://github.com/tpope/vim-db'
Plugin 'https://github.com/gberenfield/cljfold.vim'
Plugin 'https://github.com/morhetz/gruvbox'

" Done Vundling
call vundle#end()

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

" statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" tabline
let g:airline#extensions#tabline#enabled = 1

" random stuff
set hidden                      " open new files without saving current file
set noswapfile
set undofile                " create an undofile - needs vim 7.3 :(
set undodir=/tmp            " save undo files in tmp
let g:gundo_prefer_python3 = 1
nnoremap <leader>u :GundoToggle<CR>
set backspace=indent,eol,start  " make backspace work sanely
set scrolloff=10                " keep 10 lines on either side of cursor
set cursorline                  " draw a line under the cursor
set virtualedit+=block          " allow moving past end of line in visual block mode
set switchbuf=usetab,newtab     " attempt to jump to the window already open, otherwise open a new tab
au VimResized * exe "normal \<c-w>="
noremap L $                     " L goes to last character
noremap H ^                     " H goes to first character

" Color column
set colorcolumn=90                                                              " about half my laptop monitor
au WinLeave * setlocal colorcolumn=0                                            " only display in current window
au WinEnter * setlocal colorcolumn=+1                                           " ditto

" make F1 not annoy the crap out of you, aka map to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Useful arrow keys
nnoremap <Up> ddkP
nnoremap <Down> ddp
nnoremap <Left> I
nnoremap <Right> A


" tabs and idents
set autoindent smartindent      " automatically indent
set cindent                     " better indents
set expandtab                   " tabs are spaces
set tabstop=4                   " tab is 4 spaces
set softtabstop=4               " ditto
set shiftwidth=4                " ditto
set shiftround                  " ditto
vnoremap < <gv
vnoremap > >gv

" Make visual tab move entire block forward and visual shift+tab go backwards
vmap <tab>   >gv
vmap <s-tab> <gv

" searching
set showmatch                   " show matching [({
set ignorecase                  " ignore case in searches
set smartcase                   " ^ unless I capitalize
set hlsearch                    " don't highlight
set incsearch                   " search as I type
set gdefault                    " always global search/replace
"nnoremap <silent> <esc> :noh<return><esc>

" use relative numbers
set relativenumber

" colors
syntax on
set t_Co=256
set background=dark
" solarized options
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme gruvbox

" leader for copy/paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" filebrowsing
set wildignore=*.o,*.class,*.pyc,*.pyo,*.swp,*.un~      " files to ignore
set wildmode=longest,list                               " tab complete better
noremap <leader>o :NERDTreeToggle<CR>                   " open NERDTree
let g:netrw_liststyle=3                                 " use tree browser
let g:netrw_list_hide='.*\.pyc$,.*\.swp$'               " hide certain files
let g:netrw_browse_split=2                              " vsplit on open
cmap %/ %:p:h/                                          " replace '%/' with path the directory of current file

" allow saving without root permissions
cmap w!! w !sudo tee % >/dev/null

" Folding - TODO-fix this
set foldmethod=indent
set foldlevel=0

" nerd commenter
let g:NERDDefaultAlign = 'left'

" Quick Fix
noremap <leader>q <ESC>:cc<CR>

" Taglist
"let g:ctags_statusline=1
let generate_tags=1
let Tlist_Use_Horiz_Window=0
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
noremap <leader>a <Esc>:TlistToggle<CR>

" Command-T
"noremap <leader><space> <Esc>:CommandT<CR>

" Unite
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#custom#source('file_rec/async', 'ignore_pattern', '.*/lib/.*\|.*/dev/.*\|.*/dojotoolkit/.*\|.*/dojobuild/.*\|.*/doc/.*\|.*\.pyc$')
"call unite#custom#source('grep', 'ignore_pattern', '.*/lib/.*\|.*/dev/.*\|.*/dojotoolkit/.*\|.*/dojobuild/.*\|.*/doc/.*\|.*\.pyc$')
"nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async<CR>

" Ctrl P
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

au BufWritePost .vimrc so ~/.vimrc

" Get better at vim
let g:hardtime_default_on = 0

" Rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:syntastic_always_populate_loc_list = 1

"""""""""""""""" PYTHON """""""""""""""
" open pydoc buffer in a new tab
let g:pydoc_open_cmd = 'tabnew'
" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E124,E125,E126,E127,E128,W801"'

"""""""""""""""" JAVA """""""""""""""
"au FileType java silent noremap ; <Esc>mcA;<Esc>`c
let g:syntastic_java_javac_custom_classpath_command = "./get-classpath"
"let g:syntastic_java_javac_config_file_enabled = 1


"""""""""""""""" JAVASCRIPT """""""""""""""
"au FileType javascript silent noremap ; <Esc>mcA;<Esc>`c
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html']}
au FileType javascript set tabstop=2
au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2

"""""""""""""""" CLOJURE """""""""""""""
let g:syntastic_clojure_checkers = ['joker']
" configure clojure folding
let g:clojure_foldwords = "def,defn,defmacro,defmethod,defschema,defprotocol,defrecord,GET,POST,DELETE"

"""""""""""""""" XML """""""""""""""
" set tabs to 2 spaces for xml (specifically for mvn pom.xml)
au FileType xml set tabstop=2
au FileType xml set softtabstop=2
au FileType xml set shiftwidth=2
