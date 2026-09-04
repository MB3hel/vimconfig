if has('nvim')
    colorscheme default
    
    " Darken background of default color scheme
    hi normal guibg=NvimDarkGrey1
else
    " Vim format export obtained from https://gist.github.com/gcanat/3e397f414ed64a1c58efcac32a33a252
    if exists("syntax_on")
        syntax reset
    endif
    highlight clear
    set background=dark
    let g:colors_name = "neovim_default"

    hi Added gui=NONE term=NONE cterm=NONE guifg=#b3f6c0 guibg=NONE ctermfg=157 ctermbg=NONE
    hi link Boolean Constant
    hi Changed gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi link Character Constant
    hi ColorColumn gui=NONE term=reverse,inverse cterm=NONE guifg=NONE guibg=#4f5258 ctermfg=NONE ctermbg=239
    hi Comment gui=NONE term=NONE cterm=NONE guifg=#9b9ea4 guibg=NONE ctermfg=247 ctermbg=NONE
    hi Conceal gui=NONE term=NONE cterm=NONE guifg=#4f5258 guibg=NONE ctermfg=239 ctermbg=NONE
    hi link Conditional Statement
    hi Constant gui=NONE term=NONE cterm=NONE guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi CurSearch gui=NONE term=NONE cterm=NONE guifg=#07080d guibg=#fce094 ctermfg=232 ctermbg=222
    hi Cursor gui=NONE term=NONE cterm=NONE guifg=#14161b guibg=#e0e2ea ctermfg=233 ctermbg=254
    hi CursorColumn gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2c2e33 ctermfg=NONE ctermbg=236
    hi link CursorIM Cursor
    hi CursorLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#2c2e33 ctermfg=NONE ctermbg=236
    hi link CursorLineFold SignColumn
    hi CursorLineNr gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    hi link CursorLineSign SignColumn
    hi link Debug Special
    hi link Define PreProc
    hi Delimiter gui=NONE term=NONE cterm=NONE guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi DiffAdd gui=NONE term=NONE cterm=NONE guifg=#eef1f8 guibg=#005523 ctermfg=255 ctermbg=22
    hi DiffChange gui=NONE term=NONE cterm=NONE guifg=#eef1f8 guibg=#4f5258 ctermfg=255 ctermbg=239
    hi DiffDelete gui=bold term=bold cterm=bold guifg=#ffc0b9 guibg=NONE ctermfg=217 ctermbg=NONE
    hi DiffText gui=NONE term=NONE cterm=NONE guifg=#eef1f8 guibg=#007373 ctermfg=255 ctermbg=6
    hi Directory gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi link EndOfBuffer NonText
    hi Error gui=NONE term=NONE cterm=NONE guifg=#eef1f8 guibg=#590008 ctermfg=255 ctermbg=52
    hi ErrorMsg gui=NONE term=NONE cterm=NONE guifg=#ffc0b9 guibg=NONE ctermfg=217 ctermbg=NONE
    hi link Exception Statement
    hi link Float Constant
    hi link FoldColumn SignColumn
    hi Folded gui=NONE term=NONE cterm=NONE guifg=#9b9ea4 guibg=#07080d ctermfg=247 ctermbg=232
    hi Function gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi Identifier gui=NONE term=NONE cterm=NONE guifg=#a6dbff guibg=NONE ctermfg=153 ctermbg=NONE
    hi link Ignore Normal
    hi link IncSearch CurSearch
    hi link Include PreProc
    hi link Keyword Statement
    hi link Label Statement
    hi LineNr gui=NONE term=NONE cterm=NONE guifg=#4f5258 guibg=NONE ctermfg=239 ctermbg=NONE
    hi link LineNrAbove LineNr
    hi link LineNrBelow LineNr
    hi link Macro PreProc
    hi MatchParen gui=bold term=underline,bold cterm=bold guifg=NONE guibg=#4f5258 ctermfg=NONE ctermbg=239
    hi ModeMsg gui=NONE term=NONE cterm=NONE guifg=#b3f6c0 guibg=NONE ctermfg=157 ctermbg=NONE
    hi MoreMsg gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi NonText gui=NONE term=NONE cterm=NONE guifg=#4f5258 guibg=NONE ctermfg=239 ctermbg=NONE
    hi Normal gui=NONE term=NONE cterm=NONE guifg=#e0e2ea guibg=#14161b ctermfg=254 ctermbg=233
    hi link Number Constant
    hi Operator gui=NONE term=NONE cterm=NONE guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi Pmenu gui=NONE term=reverse,inverse cterm=NONE guifg=NONE guibg=#2c2e33 ctermfg=NONE ctermbg=236
    hi link PmenuExtra Pmenu
    hi link PmenuExtraSel PmenuSel
    hi link PmenuKind Pmenu
    hi link PmenuKindSel PmenuSel
    hi PmenuMatch gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    hi PmenuMatchSel gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    hi link PmenuSbar Pmenu
    hi PmenuSel gui=reverse,inverse term=underline,reverse,inverse cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    hi PmenuThumb gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#4f5258 ctermfg=NONE ctermbg=239
    hi link PreCondit PreProc
    hi PreProc gui=NONE term=NONE cterm=NONE guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi Question gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi QuickFixLine gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi Removed gui=NONE term=NONE cterm=NONE guifg=#ffc0b9 guibg=NONE ctermfg=217 ctermbg=NONE
    hi link Repeat Statement
    hi Search gui=NONE term=NONE cterm=NONE guifg=#eef1f8 guibg=#6b5300 ctermfg=255 ctermbg=58
    hi SignColumn gui=NONE term=NONE cterm=NONE guifg=#4f5258 guibg=NONE ctermfg=239 ctermbg=NONE
    hi Special gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
    hi link SpecialChar Special
    hi link SpecialComment Special
    hi SpecialKey gui=NONE term=NONE cterm=NONE guifg=#4f5258 guibg=NONE ctermfg=239 ctermbg=NONE
    hi SpellBad gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#ffc0b9
    hi SpellCap gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#fce094
    hi SpellLocal gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#b3f6c0
    hi SpellRare gui=undercurl term=undercurl cterm=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE guisp=#8cf8f7
    hi Statement gui=bold term=bold cterm=bold guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi StatusLine gui=NONE term=reverse,inverse cterm=NONE guifg=#2c2e33 guibg=#c4c6cd ctermfg=236 ctermbg=251
    hi StatusLineNC gui=NONE term=underline,bold cterm=NONE guifg=#e0e2ea guibg=#4f5258 ctermfg=254 ctermbg=239
    hi link StatusLineTerm StatusLine
    hi link StatusLineTermNC StatusLineNC
    hi link StorageClass Type
    hi String gui=NONE term=NONE cterm=NONE guifg=#b3f6c0 guibg=NONE ctermfg=157 ctermbg=NONE
    hi link Structure Type
    hi link TabLine StatusLineNC
    hi link TabLineFill StatusLineNC
    hi TabLineSel gui=bold term=NONE cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    hi link Tag Special
    hi Title gui=bold term=bold cterm=bold guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi Todo gui=bold term=bold cterm=bold guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi Type gui=NONE term=NONE cterm=NONE guifg=#e0e2ea guibg=NONE ctermfg=254 ctermbg=NONE
    hi link Typedef Type
    hi Underlined gui=underline term=underline cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
    hi link VertSplit Normal
    hi Visual gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#4f5258 ctermfg=NONE ctermbg=239
    hi link VisualNOS Visual
    hi WarningMsg gui=NONE term=NONE cterm=NONE guifg=#fce094 guibg=NONE ctermfg=222 ctermbg=NONE
    hi link WildMenu PmenuSel
    hi lCursor gui=NONE term=NONE cterm=NONE guifg=#14161b guibg=#e0e2ea ctermfg=233 ctermbg=254

    " Darken background of default color scheme
    hi normal guibg=#07080d
endif

" Nvim uses blue underline for SpellRare, but red for SpellError and yellow for SpellCap
" Make all blue by linking to SpellRare
hi! link SpellBad SpellRare
hi! link SpellCap SpellRare
hi! link SpellLocal SpellRare