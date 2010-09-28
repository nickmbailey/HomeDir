function rainbow_parenthsis#Activate()
    highlight default level1c  ctermbg=LightGray ctermfg=brown        guibg=WhiteSmoke   guifg=RoyalBlue3
    highlight default level2c  ctermbg=LightGray ctermfg=Darkblue     guibg=WhiteSmoke   guifg=SeaGreen3
    highlight default level3c  ctermbg=LightGray ctermfg=darkgray     guibg=WhiteSmoke   guifg=DarkOrchid3
    highlight default level4c  ctermbg=LightGray ctermfg=darkgreen    guibg=WhiteSmoke   guifg=firebrick3
    highlight default level5c  ctermbg=LightGray ctermfg=darkcyan     guibg=AntiqueWhite guifg=RoyalBlue3
    highlight default level6c  ctermbg=LightGray ctermfg=darkred      guibg=AntiqueWhite guifg=SeaGreen3
    highlight default level7c  ctermbg=LightGray ctermfg=darkmagenta  guibg=AntiqueWhite guifg=DarkOrchid3
    highlight default level8c  ctermbg=LightGray ctermfg=brown        guibg=AntiqueWhite guifg=firebrick3
    highlight default level9c  ctermbg=LightGray ctermfg=gray         guibg=LemonChiffon guifg=RoyalBlue3
    highlight default level10c ctermbg=LightGray ctermfg=black        guibg=LemonChiffon guifg=SeaGreen3
    highlight default level11c ctermbg=LightGray ctermfg=darkmagenta  guibg=LemonChiffon guifg=DarkOrchid3
    highlight default level12c ctermbg=LightGray ctermfg=Darkblue     guibg=LemonChiffon guifg=firebrick3
    highlight default level13c ctermbg=LightGray ctermfg=darkgreen    guibg=AliceBlue    guifg=RoyalBlue3
    highlight default level14c ctermbg=LightGray ctermfg=darkcyan     guibg=AliceBlue    guifg=SeaGreen3
    highlight default level15c ctermbg=LightGray ctermfg=darkred      guibg=AliceBlue    guifg=DarkOrchid3
    highlight default level16c ctermbg=LightGray ctermfg=red          guibg=AliceBlue    guifg=firebrick3
endfunction

function rainbow_parenthsis#Clear()
    let i = 0
    while i != 16
        let i = i + 1
        exe 'highlight clear level' . i . 'c'
    endwhile
endfunction

function rainbow_parenthsis#LoadRound ()
    syntax region level1 matchgroup=level1c start=/(/ end=/)/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level2 matchgroup=level2c start=/(/ end=/)/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level3 matchgroup=level3c start=/(/ end=/)/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level4 matchgroup=level4c start=/(/ end=/)/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level5 matchgroup=level5c start=/(/ end=/)/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level6 matchgroup=level6c start=/(/ end=/)/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level7 matchgroup=level7c start=/(/ end=/)/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level8 matchgroup=level8c start=/(/ end=/)/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level9 matchgroup=level9c start=/(/ end=/)/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level10 matchgroup=level10c start=/(/ end=/)/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level11 matchgroup=level11c start=/(/ end=/)/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level12 matchgroup=level12c start=/(/ end=/)/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
    syntax region level13 matchgroup=level13c start=/(/ end=/)/ contains=TOP,level13,level14,level15, level16,NoInParens
    syntax region level14 matchgroup=level14c start=/(/ end=/)/ contains=TOP,level14,level15, level16,NoInParens
    syntax region level15 matchgroup=level15c start=/(/ end=/)/ contains=TOP,level15, level16,NoInParens
    syntax region level16 matchgroup=level16c start=/(/ end=/)/ contains=TOP,level16,NoInParens
endfunction

function rainbow_parenthsis#LoadSquare ()
    syntax region level1 matchgroup=level1c start=/\[/ end=/\]/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level2 matchgroup=level2c start=/\[/ end=/\]/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level3 matchgroup=level3c start=/\[/ end=/\]/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level4 matchgroup=level4c start=/\[/ end=/\]/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level5 matchgroup=level5c start=/\[/ end=/\]/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level6 matchgroup=level6c start=/\[/ end=/\]/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level7 matchgroup=level7c start=/\[/ end=/\]/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level8 matchgroup=level8c start=/\[/ end=/\]/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level9 matchgroup=level9c start=/\[/ end=/\]/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level10 matchgroup=level10c start=/\[/ end=/\]/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level11 matchgroup=level11c start=/\[/ end=/\]/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level12 matchgroup=level12c start=/\[/ end=/\]/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
    syntax region level13 matchgroup=level13c start=/\[/ end=/\]/ contains=TOP,level13,level14,level15, level16,NoInParens
    syntax region level14 matchgroup=level14c start=/\[/ end=/\]/ contains=TOP,level14,level15, level16,NoInParens
    syntax region level15 matchgroup=level15c start=/\[/ end=/\]/ contains=TOP,level15, level16,NoInParens
    syntax region level16 matchgroup=level16c start=/\[/ end=/\]/ contains=TOP,level16,NoInParens
endfunction

function rainbow_parenthsis#LoadBraces ()
    syntax region level1 matchgroup=level1c start=/{/ end=/}/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level2 matchgroup=level2c start=/{/ end=/}/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level3 matchgroup=level3c start=/{/ end=/}/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level4 matchgroup=level4c start=/{/ end=/}/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level5 matchgroup=level5c start=/{/ end=/}/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level6 matchgroup=level6c start=/{/ end=/}/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level7 matchgroup=level7c start=/{/ end=/}/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level8 matchgroup=level8c start=/{/ end=/}/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level9 matchgroup=level9c start=/{/ end=/}/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level10 matchgroup=level10c start=/{/ end=/}/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level11 matchgroup=level11c start=/{/ end=/}/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level12 matchgroup=level12c start=/{/ end=/}/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
    syntax region level13 matchgroup=level13c start=/{/ end=/}/ contains=TOP,level13,level14,level15, level16,NoInParens
    syntax region level14 matchgroup=level14c start=/{/ end=/}/ contains=TOP,level14,level15, level16,NoInParens
    syntax region level15 matchgroup=level15c start=/{/ end=/}/ contains=TOP,level15, level16,NoInParens
    syntax region level16 matchgroup=level16c start=/{/ end=/}/ contains=TOP,level16,NoInParens
endfunction

function rainbow_parenthsis#LoadChevrons ()
    syntax region level1 matchgroup=level1c start=/</ end=/>/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level2 matchgroup=level2c start=/</ end=/>/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level3 matchgroup=level3c start=/</ end=/>/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level4 matchgroup=level4c start=/</ end=/>/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level5 matchgroup=level5c start=/</ end=/>/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level6 matchgroup=level6c start=/</ end=/>/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level7 matchgroup=level7c start=/</ end=/>/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level8 matchgroup=level8c start=/</ end=/>/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level9 matchgroup=level9c start=/</ end=/>/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level10 matchgroup=level10c start=/</ end=/>/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level11 matchgroup=level11c start=/</ end=/>/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
    syntax region level12 matchgroup=level12c start=/</ end=/>/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
    syntax region level13 matchgroup=level13c start=/</ end=/>/ contains=TOP,level13,level14,level15, level16,NoInParens
    syntax region level14 matchgroup=level14c start=/</ end=/>/ contains=TOP,level14,level15, level16,NoInParens
    syntax region level15 matchgroup=level15c start=/</ end=/>/ contains=TOP,level15, level16,NoInParens
    syntax region level16 matchgroup=level16c start=/</ end=/>/ contains=TOP,level16,NoInParens
endfunction
