"""""""""""""""""""" GENERAL """""""""""""""""""""

set nocompatible                " don't be compatible with old versions, thats dumb
let mapleader = ","             " better leader key

" start pathogen
filetype off                    " need to turn off filetype specifics before loading pathogen
call pathogen#runtime_append_all_bundles()

" random stuff
set hidden                      " open new files without saving current file
set noswapfile
if version >= 703
    set undofile                " create an undofile - needs vim 7.3 :(
    set undodir=/tmp            " save undo files in tmp
endif
set backspace=indent,eol,start  " make backspace work sanely
set ruler                       " show position in bottom right
set scrolloff=10                " keep 10 lines on either side of cursor

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

" make F1 not annoy the crap out of you, aka map to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" tabs and idents
set autoindent                  " automatically indent
set smartindent                 " brilliant indents
set expandtab                   " tabs are spaces
set tabstop=4                   " tab is 4 spaces
set softtabstop=4               " ditto
set shiftwidth=4                " ditto
set shiftround                  " ditto

" Make visual tab move entire block forward and visual shift+tab go backwards
vmap <tab>   >gv
vmap <s-tab> <gv

" Make tab act like % (move between parens, brackets, etc).
nnoremap <tab> %

" searching
set showmatch                   " show matching [({
set hlsearch                    " highlight matches
set ignorecase                  " ignore case in searches
set smartcase                   " ^ unless I capitalize
set nohlsearch                  " don't highlight
set incsearch                   " search as I type
set gdefault                    " always global search/replace

" colors
syntax on
colorscheme darkblue
highlight Folded ctermfg=gray   " need to see the folds

" allow mouse toggling - useful for scrolling and moving windows
set mouse=a
fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif
    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction
noremap <F12> :call <SID>ToggleMouse()<CR>

" highlight whitespace
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" filebrowsing
set wildignore=*.o,*.class,*.pyc,*.pyo,*.swp,*.un~      " files to ignore
set wildmode=list:longest,full                          " tab complete better

" toggle pasting (ignores autoindent when pasting)
set pastetoggle=<F2>

" copy/paste to clipboard
noremap y "*y
nnoremap yy "*yy
noremap Y "*Y
noremap d "*d
nnoremap dd "*dd
noremap D "*D
noremap p "*p
noremap P "*P

" allow saving without root permissions
cmap w!! w !sudo tee % >/dev/null

"rainbow parens - useful for lisp
noremap <F3> :call rainbow_parentheses#Toggle () <CR>

" Folding - TODO-fix this
set foldmethod=indent
set foldlevel=0

" When in file search mode, use c-k and c-j to jump matches
map <c-k> :Pexplore<CR>
map <c-j> :Nexplore<CR>

" File browsing
noremap <F4> :Vexplore <CR> :set winfixwidth <CR>   " keep file browsing window the same size
let g:netrw_liststyle=3                             " use tree browser
let g:netrw_list_hide='.*\.pyc$,.*\.swp$'           " hide certain files
let g:netrw_browse_split=2                          " vsplit on open

"""""""""""""""" PYTHON """""""""""""""
" auto complete
au filetype python setl omnifunc=pythoncomplete#Complete    " complete function
au filetype python inoremap <Nul> <C-x><C-o>                " ctrl + space

" compile
au filetype python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
au filetype python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" execute code from visual mode
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
au filetype python map <C-h> :py EvaluateCurrentRange()<CR>


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
