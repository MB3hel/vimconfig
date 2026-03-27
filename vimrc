
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

command -nargs=1 IndentSpaces call IndentSpaces(<q-args>)
command -nargs=1 IndentTabs call IndentTabs(<q-args>)

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
set t_Co=16                                     " Allow 16 ANSI colors (if notermguicolors)
set termguicolors                               " Use GUI colors always (unless we know term can't)
if $TERM == 'linux'
    set notermguicolors                         " This terminal doesn't support GUI colors 
    set t_Co=8                                  " This terminal doesn't support 16 colors
endif
colorscheme desert                              " Vim default is unreadable in many terminals
hi NonText ctermbg=NONE guibg=NONE              " Color for unused lines (no different)
hi ColorColumn ctermbg=8 guibg=#4f5258          " Color for color column
hi ColorColumn ctermfg=NONE guifg=NONE          " Text in color column retains color
hi Visual ctermbg=8 guibg=#4f5258               " Selected text background color
hi Visual ctermfg=NONE guifg=NONE cterm=NONE    " Selected text retains color
if $TERM == 'linux'
    hi ColorColumn ctermbg=7                    " Alternate color for terminals w/ only 8 colors 
    hi Visual ctermbg=7                         " Alternate color for terminals w/ only 8 colors
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

" Indentation
call IndentSpaces(4)                            " Default to 4 space indentation
set smartindent                                 " Preserve indent

" Tab completion
" Only apply on vim (nvim has good defaults)
if !has('nvim')
    set wildignorecase                          " Case insensitive 
    set wildmode=list:longest,full              " Completion behavior
endif

" Cursor settings
let &t_SI = "\e[5 q"                            " Insert mode blinking line
let &t_EI = "\e[2 q"                            " Normal mode solid block

" netrw settings
" let g:netrw_banner=0                          " https://github.com/neovim/neovim/issues/23650
let g:netrw_liststyle=3                         " Tree style

" Custom & remapped commands
command Lex Lexplore 20                         " Lex will use width 20 by default

" Custom keybinds
nnoremap <leader>l :ls<CR>:b<space>
nnoremap <C-f> :Lex<CR>

" --------------------------------------------------------------------------------------------------

