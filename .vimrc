"""""""""""""""""""" GENERAL """""""""""""""""""""
set nocompatible                " don't be compatible with old versions, thats dumb
let mapleader = ","             " better leader key
let maplocalleader = ","        " local leader too

" start pathogen
filetype off                    " need to turn off filetype specifics before loading pathogen
call pathogen#runtime_append_all_bundles()

" statusline
set statusline=%<%{&ff}\ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%t\ %Y\ %n\ %m%r%h%w\ %{fugitive#statusline()}\ %=%03p%%\ [%04l,%04v]\ %L
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
set colorcolumn=90              " about half my laptop monitor
set virtualedit+=block          " allow moving past end of line in visual block mode
set switchbuf=usetab,newtab     " attempt to jump to the window already open, otherwise open a new tab
au VimResized * exe "normal \<c-w>="
noremap L $                     " L goes to last character
noremap H ^                     " H goes to first character

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

let g:syntastic_enable_signs=1
let syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1

" make F1 not annoy the crap out of you, aka map to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" tabs and idents
set autoindent smartindent      " automatically indent
set cindent                     " better indents
set expandtab                   " tabs are spaces
set tabstop=4                   " tab is 4 spaces
set softtabstop=4               " ditto
set shiftwidth=4                " ditto
set shiftround                  " ditto
nnoremap < <gv
nnoremap > >gv

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
nnoremap <silent> <esc> :noh<return><esc>

" colors
syntax on
colorscheme molokai
highlight Folded ctermfg=gray   " need to see the folds

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

" toggle pasting (ignores autoindent when pasting)
set pastetoggle=<F2>

" allow saving without root permissions
cmap w!! w !sudo tee % >/dev/null

" Folding - TODO-fix this
set foldmethod=indent
set foldlevel=0

" Quick Fix
noremap <leader>q <ESC>:cc<CR>

" When in file search mode, use c-k and c-j to jump matches
map <c-k> :Pexplore<CR>
map <c-j> :Nexplore<CR>

" Taglist
let g:ctags_statusline=1
let generate_tags=1
let Tlist_Use_Horiz_Window=0
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
noremap <leader>a <Esc>:TlistToggle<CR>

" Command-T
noremap <leader>f <Esc>:CommandT<CR>

"""""""""""""""" PYTHON """""""""""""""
" auto complete
au filetype python setl omnifunc=pythoncomplete#Complete    " complete function
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" open pydoc buffer in a new tab
let g:pydoc_open_cmd = 'tabnew'

"""""""""""""""" JAVA """""""""""""""
"au FileType java silent noremap ; <Esc>mcA;<Esc>`c


"""""""""""""""" JAVASCRIPT """""""""""""""
"au FileType javascript silent noremap ; <Esc>mcA;<Esc>`c

"""""""""""""""" CLOJURE """""""""""""""
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1
let vimclojure#WantNailgun = 1

"  Automagic Clojure folding on defn's and defmacro's
function GetClojureFold()
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

function TurnOnClojureFolding()
      setlocal foldexpr=GetClojureFold()
      setlocal foldmethod=expr
endfunction

autocmd FileType clojure call TurnOnClojureFolding()
