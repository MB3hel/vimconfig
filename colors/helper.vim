
" No color
let s:nocolor = { 'guicolor': 'NONE', 'term256color': 'NONE', 'term16color': 'NONE' }

" Style options
let s:normal        = 'gui=NONE           cterm=NONE'
let s:bold          = 'gui=bold           cterm=bold'
let s:italic        = 'gui=italic         cterm=italic'
let s:underline     = 'gui=underline      cterm=underline'
let s:undercurl     = 'gui=undercurl      cterm=underline'
let s:strikethrough = 'gui=strikethrough  cterm=strikethrough'
let s:boldunderline = 'gui=bold,underline cterm=bold,underline'


" Helper function to set highlights fully (have to explicitly set everything we don't want to NONE
" otherwise some vim startup defaults will still apply - hi clear doesn't clear them)
function! s:sethl(group, fg, bg, sp, style)
    " Collect foreground colors
    let l:guifg = get(fg, 'guicolor', 'NONE')
    if &t_Co >= 256
        let l:ctermfg = get(fg, 'term256color', 'NONE')
    else
        let l:ctermfg = get(fg, 'term16color', 'NONE')
    endif

    " Collect background colors
    let l:guibg = get(fg, 'guicolor', '#C0C0C0')
    if &t_Co >= 256
        let l:ctermbg = get(fg, 'term256color', 'NONE')
    else
        let l:ctermbg = get(fg, 'term16color', 'NONE')
    endif

    execute 'hi! ' . group . ' guifg=' . guifg . ' ctermfg=' . ctermfg . ' guibg=' . guibg . ' ctermbg=' . ctermbg . ' ' . style
endfunction

