set nocompatible                " don't be compatible with old versions, thats dumb

" start pathogen
filetype off                    " need to turn off filetype specifics before loading pathogen
call pathogen#runtime_append_all_bundles()

" random stuff
set hidden                      " open new files without saving current file
set undofile                    " create an undofile - needs vim 7.3 :(
set undodir=/tmp                " save undo files in tmp
set backspace=indent,eol,start  " make backspace work sanely

" File type specifics
filetype plugin indent on       " turn on different indents and plugins for specific filetypes

" make F1 not annoy the crap out of you, aka map to esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" tabs and idents
set autoindent                  " automatically indent
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
set ignorecase                  " ignore case in searches
set smartcase                   " ^ unless I capitalize
set nohlsearch                  " don't highlight
set incsearch                   " search as I type
set gdefault                    " always global search/replace

" colors
syntax on
colorscheme darkblue

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
set wildignore=*.o,*.class,*.pyc,*.pyo,*.swp,*.un~     " files to ignore
set wildmode=list:longest,full                          " tab complete better

" toggle pasting (ignores autoindent when pasting)
set pastetoggle=<F2>

" allow saving without root permissions
cmap w!! w !sudo tee % >/dev/null

"rainbow parens
noremap <F2> :call rainbow_parentheses#Toggle () <CR>

" Folding - TODO-fix this
set foldmethod=indent
set foldlevel=1
function! MyFoldLevel( lineNumber )
    let thisLine = getline( a:lineNumber )
    " If the entire Javadoc comment or the {} pair is on one line, then don't create a fold for it.
    if ( thisLine =~ '\%(\%(/\*\*\).*\%(\*/\)\)\|\%({.*}\)' )
        return '='
    elseif ( thisLine =~ '\%(^\s*/\*\*\s*$\)\|{' )
        return "a1"
    elseif ( thisLine =~ '\%(^\s*\*/\s*$\)\|}' )
        return "s1"
    endif
    return '='
endfunction

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
