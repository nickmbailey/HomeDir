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
Plugin 'altercation/vim-colors-solarized' " solarized theme
Plugin 'scrooloose/nerdcommenter' " easy block commenting
Plugin 'scrooloose/nerdtree'      " file explorer
Plugin 'Xuyuanp/nerdtree-git-plugin' " git support for nerdtree
Plugin 'jlanzarotta/bufexplorer' " easy buffer expoloration
Plugin 'tpope/vim-fugitive' " git support
Plugin 'tpope/vim-rhubarb' " github support
Plugin 'tpope/vim-surround' " easy swap of surrounding chars
Plugin 'mbbill/undotree' " awesome undo tree view
Plugin 'vim-airline/vim-airline' " better statusline
Plugin 'scrooloose/syntastic' " syntax checkers
Plugin 'dense-analysis/ale' " lint engine
Plugin 'sheerun/vim-polyglot' " weird language support
Plugin 'jaxbot/semantic-highlight.vim' " highlight different variables (bad clojure support)
Plugin 'tpope/vim-dotenv' " .env support
Plugin 'https://github.com/tpope/vim-dadbod' " run db queries
Plugin 'neoclide/coc.nvim', {'branch': 'release'} "javascript completion
Plugin 'junegunn/fzf' " file finding
Plugin 'junegunn/fzf.vim' " file finding
Plugin 'unblevable/quick-scope' " jumping within a line
Plugin 'github/copilot.vim'

Plugin 'liuchengxu/vim-which-key'
nnoremap <silent> <leader> :WhichKey ','<CR>
let g:which_key_use_floating_win=1
let g:which_key_floating_relative_win=1

" clojure stuff
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'aclaimant/syntastic-joker' " joker clojure linter for syntastic
Plugin 'guns/vim-slamhound'
Plugin 'https://github.com/gberenfield/cljfold.vim'
Plugin 'guns/vim-clojure-static'

Plugin 'https://github.com/morhetz/gruvbox' " current colorscheme

" Done Vundling
call vundle#end()

" ======= COC general config =======

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" ======= Vim general config =======

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

" Load env on startup
if filereadable(".env")
    autocmd VimEnter * Dotenv .
endif

" statusline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" tabline
let g:airline#extensions#tabline#enabled = 1

" random stuff
set hidden                      " open new files without saving current file
set noswapfile
set backspace=indent,eol,start  " make backspace work sanely
set scrolloff=10                " keep 10 lines on either side of cursor
set cursorline                  " draw a line under the cursor
set virtualedit+=block          " allow moving past end of line in visual block mode

" resize splits when window resizes
au VimResized * exe "normal \<c-w>="

" Undo config
set undofile                " create an undofile
set undodir=/tmp            " save undo files in tmp
nnoremap <leader>u :UndotreeToggle<CR>

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

" use relative numbers
set relativenumber

" colors
syntax on
set t_Co=256
set background=dark
set termguicolors
let g:gruvbox_italic=1
colorscheme gruvbox

" completion
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <Nul> <C-x><C-o>

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

" filebrowsing (native)
set wildignore=*.o,*.class,*.pyc,*.pyo,*.swp,*.un~      " files to ignore
set wildmode=longest,list                               " tab complete better
let g:netrw_liststyle=3                                 " use tree browser
let g:netrw_list_hide='.*\.pyc$,.*\.swp$'               " hide certain files
let g:netrw_browse_split=2                              " vsplit on open
cmap %/ %:p:h/                                          " replace '%/' with path the directory of current file

" nerdtree file browsing
autocmd StdinReadPre * let s:std_in=1                                           " open NERDTree when vim opens
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif     " open NERDTree when vim opens
autocmd StdinReadPre * let s:std_in=1                                           " open NERDTree when vim opens
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif " open NERDTree when vim opens
noremap <leader>o :NERDTreeToggle<CR>                   " open NERDTree

" allow saving without root permissions
cmap w!! w !sudo tee % >/dev/null

" Folding - TODO-fix this
set foldmethod=syntax
set foldlevel=1

" nerd commenter
let g:NERDDefaultAlign = 'left'

" Quick Fix
noremap <leader>q <ESC>:cc<CR>

" FZF
noremap <leader>f <Esc>:Files<CR>
noremap <leader>a <Esc>:Ag<Space>

" Fugitive
noremap <leader>g <Esc>:vertical Git<CR>:vertical resize 40<CR>

au BufWritePost .vimrc so ~/.vimrc

" Rainbow parens
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" syntastic
let g:syntastic_always_populate_loc_list = 1

" ale
let g:ale_fixers = {'javascript': ['prettier'], 'css': ['prettier'], 'typescript': ['prettier']}
let g:ale_fix_on_save = 1

"""""""""""""""" JAVASCRIPT """""""""""""""
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html']}
au FileType javascript set tabstop=2
au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2

"""""""""""""""" TYPESCRIPT """""""""""""""
au FileType typescript set tabstop=2
au FileType typescript set softtabstop=2
au FileType typescript set shiftwidth=2
au Filetype typescript :CocCommand tsserver.watchBuild

"""""""""""""""" CLOJURE """""""""""""""
let g:ale_linters = {'clojure': ['clj-kondo', 'joker']}
let g:syntastic_clojure_checkers = ['joker', 'clj-kondo']
" configure clojure folding
let g:clojure_foldwords = "ns,def,defn,defmacro,defmethod,defschema,defprotocol,defrecord,GET,POST,DELETE"

"""""""""""""""" XML """""""""""""""
" set tabs to 2 spaces for xml (specifically for mvn pom.xml)
au FileType xml set tabstop=2
au FileType xml set softtabstop=2
au FileType xml set shiftwidth=2
