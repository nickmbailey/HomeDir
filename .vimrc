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
set ruler                       " show position in bottom right
set scrolloff=10                " keep 10 lines on either side of cursor
set cursorline                  " draw a line under the cursor
set virtualedit+=block          " allow moving past end of line in visual block mode

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

" make F1 not annoy the crap out of you, aka map to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" tabs and idents
set autoindent                  " automatically indent
set cindent                     " better indents
set expandtab                   " tabs are spaces
set tabstop=4                   " tab is 4 spaces
set softtabstop=4               " ditto
set shiftwidth=4                " ditto
set shiftround                  " ditto

" Make visual tab move entire block forward and visual shift+tab go backwards
vmap <tab>   >gv
vmap <s-tab> <gv

" searching
set showmatch                   " show matching [({
set ignorecase                  " ignore case in searches
set smartcase                   " ^ unless I capitalize
set nohlsearch                  " don't highlight
set incsearch                   " search as I type
set gdefault                    " always global search/replace

" colors
syntax on
colorscheme darkblue
highlight Folded ctermfg=gray   " need to see the folds

" Enable mouse in normal mode. Leave it disabled in insert mode for
" easy copy/paste.
set mouse=n

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" filebrowsing
set wildignore=*.o,*.class,*.pyc,*.pyo,*.swp,*.un~      " files to ignore
set wildmode=longest,list                               " tab complete better
noremap <leader>o :NERDTreeToggle<CR>                   " open NERDTree
let g:netrw_liststyle=3                                 " use tree browser
let g:netrw_list_hide='.*\.pyc$,.*\.swp$'               " hide certain files
let g:netrw_browse_split=2                              " vsplit on open

" toggle pasting (ignores autoindent when pasting)
set pastetoggle=<F2>

" allow saving without root permissions
cmap w!! w !sudo tee % >/dev/null

" Folding - TODO-fix this
set foldmethod=syntax
"set foldlevel=0

" When in file search mode, use c-k and c-j to jump matches
map <c-k> :Pexplore<CR>
map <c-j> :Nexplore<CR>

" Taglist
let g:ctags_statusline=1
let generate_tags=1
let Tlist_Use_Horiz_Window=0

" Pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

"""""""""""""""" PYTHON """""""""""""""
" auto complete
au filetype python setl omnifunc=pythoncomplete#Complete    " complete function
au filetype python inoremap <Nul> <C-x><C-o>                " ctrl + space

" compile, use pylint
autocmd! BufRead,BufNewFile *.py compiler pylint
let g:pylint_onwrite = 0

" execute code from visual mode
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
au filetype python map <C-h> :py EvaluateCurrentRange()<CR>

" open pydoc buffer in a new tab
let g:pydoc_open_cmd = 'tabnew'

"""""""""""""""" JAVA """""""""""""""
au FileType java silent noremap ; <Esc>mcA;<Esc>`c


"""""""""""""""" JAVASCRIPT """""""""""""""
au FileType javascript silent noremap ; <Esc>mcA;<Esc>`c

"""""""""""""""" CLOJURE """""""""""""""
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#DynamicHighlighting = 1

""""""""""""""" RANDOM JUNK """"""""""""""""""
" Attempt at fixing braces on newlines only when editing a file (kinda works)
"au BufRead *.java :%s/\n\(\s*{\)/\1/g
"au BufWrite *.java :%s/\(\S\+\)\(\s*{\)\n/\1\r\2\r/g

" Attempt at custom java folding function
"function! GetFoldText(lnum)
"	let MyCount = 0
"	while 1
"		let line = getline(a:lnum+MyCount)
"		if line =~ '^\s/'
"			let MyCount = MyCount + 1
"			continue
"		elseif indent(a:lnum+MyCount) > 4
"			let MyCount = MyCount +1
"			continue
"		elseif line =~ '^\s@'
"			let MyCount = MyCount +1
"			continue
"		else
"			return line
"		endif
"	endwhil
"endfunction
"set foldtext=GetFoldText(v:foldstart)
"set foldmethod=expr foldexpr=MyFoldLevel(v:lnum)

" rainbow parens for clojure
" let clj_highlight_builtins = 1
" let clj_paren_rainbow = 1

" Some old plugin stuff I've tried
"set ofu=javacomplete#Complete
"set tags=../tags
"
"
