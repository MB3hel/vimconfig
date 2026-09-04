
colorscheme desert                              " Vim default is unreadable
hi NonText ctermbg=NONE guibg=NONE              " Color for unused lines (no different)
hi ColorColumn ctermbg=8 guibg=#4f5258          " Color for color column
hi ColorColumn ctermfg=NONE guifg=NONE          " Text in color column retains color
hi Visual ctermbg=8 guibg=#4f5258               " Selected text background color
hi Visual ctermfg=NONE guifg=NONE cterm=NONE    " Selected text retains foreground color
hi StatusLine term=bold,reverse                 " Default colors (older versions don't match)
hi StatusLine ctermfg=236 ctermbg=144           " Default colors (older versions don't match)
hi StatusLine guifg=#333333 guibg=#c2bfa5       " Default colors (older versions don't match)

" nvim specific color scheme tweaks
if has('nvim')
    hi LspInlayHint ctermfg=66 guifg=#6d8787 gui=italic cterm=italic
endif

" For terminals known to only support 8 colors correct some vim settings
if &t_Co < 16
    hi ColorColumn ctermbg=7
    hi Visual ctermbg=7
    hi StatusLine ctermfg=7 ctermbg=0 
endif