
" --------------------------------------------------------------------------------------------------
" Functions (usable by project specific config files)
" --------------------------------------------------------------------------------------------------

" Indent using spaces (width = # spaces)
function IndentSpaces(width)
    let &tabstop=a:width                        " Size to render tab (\t)
    let &shiftwidth=a:width                     " Size of indentation
    let &softtabstop=a:width                    " Number of spaces a tab (\t) counts as
    set expandtab                               " Use spaces for tabs
endfunction

" Indent using tabs (width = columns to render tab as)
function IndentTabs(width)
    let &tabstop=a:width                        " Size to render tab (\t)
    let &shiftwidth=a:width                     " Size of indentation
    let &softtabstop=0                          " Don't mix tabs and spaces on indent
    set noexpandtab                             " Use tabs not spaces
endfunction

" Disable vim replacing the terminal's default bg. Allows transparency to
" still work in vim
function DefaultBg()
    hi Normal guibg=NONE ctermbg=NONE
endfunction

command -nargs=1 IndentSpaces call IndentSpaces(<q-args>)
command -nargs=1 IndentTabs call IndentTabs(<q-args>)

" Add to vimrc_overrides when terminal uses transparent bg or if you want to
" use default terminal bg color instead of having vim replace
command UseDefaultBg hi Normal guibg=NONE ctermbg=NONE

" --------------------------------------------------------------------------------------------------


" --------------------------------------------------------------------------------------------------
" Configuration
" --------------------------------------------------------------------------------------------------

" Turn on syntax highlight BEFORE messing with colors
syntax enable 

" Fix termguicolors with normal vim in tmux
" Terminal emulator still must support 24-bit color and tmux must be aware of that fact 
" (in PuTTY this requires setting terminal to xterm-256color)
if !has('nvim') && (stridx($TERM, 'screen')==0 || stridx($TERM, 'tmux')==0)
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Color scheme settings
if $TERM != 'linux'
    set termguicolors                           " Use GUI colors always (unless we know term can't)
                                                " Disable in overrides if terminal doesn't support
endif
set t_Co=16                                     " Allow 16 ANSI colors always (only matters if 
                                                " notermguicolors; vim in PuTTY defaults to 8)
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
" nvim still doesn't need this since its default theme is sane
if $TERM == 'linux'
    set t_Co=8                                  " This terminal doesn't support 16 colors
    hi ColorColumn ctermbg=7
    hi Visual ctermbg=7
    hi StatusLine ctermfg=7 ctermbg=0 
endif

" Editing options
set nowrap                                      " Disable line wrap
set number                                      " Show line numbers
set hidden                                      " Allow unsaved buffers to be hidden
set mouse=a                                     " Enable mouse
set clipboard=unnamedplus                       " System clipboard
                                                " On Linux requires xclip or wl-clipboard
set whichwrap+=<,>,h,l,[,]                      " Wrap between lines
set backspace=indent,eol,start                  " Fixes backspace (mostly on windows)
set cc=100                                      " Default color column (right margin)
set showcmd                                     " Shows counts of selection in visual mode
set laststatus=2                                " Always show status line
set timeout                                     " Enable timeout (match nvim defaults)
set timeoutlen=1000                             " Match nvim default timeoutlen
set ttimeout                                    " Enable ttimeout (match nvim defaults)
set ttimeoutlen=50                              " Match nvim default ttimeoutlen
set belloff=all                                 " No terminal bell
set virtualedit=onemore                         " Allow cursor to right of last char in normal mode

" Don't move cursor left one leaving insert mode
:inoremap <silent> <Esc> <Esc>`^

" When wrapping up a line with left arrow, keep cursor at end (the 'onemore' position)
nnoremap <silent> <Left> :call WrapLeftOneMore()<CR>
function! WrapLeftOneMore()
    " Check if cursor is at the first column of the line
    if col('.') == 1 && line('.') > 1
        " Move up one line and position cursor one past the last character
        normal! k$
        if col('.') < col('$')
            normal! l
        endif
    else
        " Otherwise, perform standard left arrow movement
        execute "normal! \<Left>"
    endif
endfunction

" Indentation
call IndentSpaces(4)                            " Default to 4 space indentation
set smartindent                                 " Preserve indent

" Tab completion
" Only apply on vim (nvim has good defaults)
if !has('nvim')
    set wildignorecase                          " Case insensitive 
    set wildmode=list:longest,full              " Completion behavior
endif

" Look for ctags in the file's current directory and up
" ./ should refer to the file's directory not vim's cwd in a tags setting
set tags=./tags;,tags;

" Cursor settings
if has("nvim")
    " nvim uses guicorsor not escapes to the terminal
    set guicursor=n-v-c-sm:ver25,i-ci-ve-r-cr-o:ver25-blinkon500-blinkoff500,t:ver25-blinkon500-blinkoff500-TermCursor
else
    " vim uses escapes to the terminal
    let &t_SI = "\e[5 q"                            " Insert mode blinking line
    let &t_EI = "\e[6 q"                            " Normal mode solid line
    let &t_te ..= "\e[5 q"                          " Blinking line when exiting vim
endif

" netrw settings
" Note: Do not disable banner because of nvim bug with wl-copy
" https://github.com/neovim/neovim/issues/23650
" On gnome, wl-copy also opens a GUI window, momentarily taking focus from
" vim. With banner disabled and tree style, this "spams" wl-copy
" making everything unusable
" let g:netrw_banner=0
let g:netrw_liststyle=3                         " Tree style

" Custom & remapped commands
command Lex Lexplore 20                         " Lex will use width 20 by default
command CtagsRun execute 'silent !ctags -R --exclude=.git --exclude=venv --exclude=env --exclude=.venv --exclude=.env -R ' . shellescape(substitute(fnamemodify(getcwd(), ':p:h'), '\\', '/', 'g')) | redraw!
command CtagsShow execute 'echo tagfiles()'

" Custom keybinds
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <C-f> :Lex<CR>

" Fix windows terminal being broken when exiting vim/nvim sometimes
" autocmd VimLeave * :redraw!

" --------------------------------------------------------------------------------------------------

