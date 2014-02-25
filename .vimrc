"""""""""""""""""""" GENERAL """""""""""""""""""""
set tabpagemax=30
set nocompatible                " don't be compatible with old versions, thats dumb
let mapleader = ","             " better leader key
let maplocalleader = ","        " local leader too

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
" Additional plugins
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pylint.vim'
Bundle 'tpope/vim-surround'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'kevinw/pyflakes-vim'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/paredit.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/unite.vim'

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

" statusline
set laststatus=2

" random stuff
set hidden                      " open new files without saving current file
set noswapfile
if version >= 703
    set undofile                " create an undofile - needs vim 7.3 :(
    set undodir=/tmp            " save undo files in tmp
    nnoremap <leader>u :GundoToggle<CR>
endif
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

" colors
syntax on
set t_Co=256
set background=dark
" solarized options
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"colorscheme molokai
"highlight Folded ctermfg=gray   " need to see the folds

" Enable mouse in normal mode. Leave it disabled in insert mode for
" easy copy/paste.
set mouse=n
set mousehide                   " hide mouse when typing
set mousemodel=popup

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

" Quick Fix
noremap <leader>q <ESC>:cc<CR>

" Taglist
let g:ctags_statusline=1
let generate_tags=1
let Tlist_Use_Horiz_Window=0
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
noremap <leader>a <Esc>:TlistToggle<CR>

" Command-T
"noremap <leader><space> <Esc>:CommandT<CR>

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async', 'ignore_pattern', '.*/lib/.*\|.*/dev/.*\|.*/dojotoolkit/.*\|.*/dojobuild/.*\|.*/doc/.*\|.*\.pyc$')
call unite#custom#source('grep', 'ignore_pattern', '.*/lib/.*\|.*/dev/.*\|.*/dojotoolkit/.*\|.*/dojobuild/.*\|.*/doc/.*\|.*\.pyc$')
nnoremap <C-p> :<C-u>Unite -start-insert file_rec/async<CR>

au BufWritePost .vimrc so ~/.vimrc

"""""""""""""""" PYTHON """""""""""""""
" open pydoc buffer in a new tab
let g:pydoc_open_cmd = 'tabnew'
" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E501,E302,E261,E701,E241,E124,E125,E126,E127,E128,W801"'

"""""""""""""""" JAVA """""""""""""""
"au FileType java silent noremap ; <Esc>mcA;<Esc>`c
let g:syntastic_java_javac_config_file_enabled = 1


"""""""""""""""" JAVASCRIPT """""""""""""""
"au FileType javascript silent noremap ; <Esc>mcA;<Esc>`c
let g:syntastic_javascript_checker = "jshint"
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html']}

"""""""""""""""" CLOJURE """""""""""""""
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#FuzzyIndent = 1
let vimclojure#WantNailgun = 0
let vimclojure#SplitPos = "left"
let vimclojure#SplitSize = "20"

"  Automagic Clojure folding on defn's and defmacro's
function! GetClojureFold()
      if getline(v:lnum) =~ '^\s*(def.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*$'
            let my_cljnum = v:lnum
            let my_cljmax = line("$")

            while (1)
                  let my_cljnum = my_cljnum + 1
                  if my_cljnum > my_cljmax
                        return "<1"
                  endif

                  let my_cljdata = getline(my_cljnum)

                  " If we match an empty line, stop folding
                  if my_cljdata =~ '^$'
                        return "<2"
                  else
                        return "="
                  endif
            endwhile
      else
            return "="
      endif
endfunction

function! TurnOnClojureFolding()
      setlocal foldexpr=GetClojureFold()
      setlocal foldmethod=expr
endfunction

autocmd FileType clojure call TurnOnClojureFolding()
