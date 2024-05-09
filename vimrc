
" ------------------------------------------------------------------------------
" Functions (usable by project specific config files)
" ------------------------------------------------------------------------------

" Indent using spaces (width = # spaces)
function IndentSpaces(width)
    let &tabstop=a:width            " Size to render tab (\t)
    let &shiftwidth=a:width         " Size of indentation
    let &softtabstop=a:width        " Number of spaces a tab (\t) counts as
    set expandtab                   " Use spaces for tabs
endfunction

" Indent using tabs (width = columns to render tab as)
function IndentTabs(width)
    let &tabstop=a:width            " Size to render tab (\t)
    let &shiftwidth=a:width         " Size of indentation
    let &softtabstop=0              " Don't mix tabs and spaces on indent
    set noexpandtab                 " Use tabs not spaces
endfunction

" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
" Configuration
" ------------------------------------------------------------------------------

" Editing options
set nowrap                          " Disable line wrap
set number                          " Show line numbers
set hidden                          " Allow unsaved buffers to be hidden
set mouse=a                         " Enable mouse
set clipboard=unnamedplus           " System clipboard
                                    " On Linux requires xclip or wl-clipboard
set whichwrap+=<,>,h,l,[,]          " Wrap between lines 
set backspace=indent,eol,start      " Fixes backspace (mostly on windows)
set cc=80                           " Default color column (right margin)
highlight ColorColumn ctermbg=235   " Color for color column

" Indentation
call IndentSpaces(4)                " Default to 4 space indentation
set smartindent                     " Preserve indent

" Tab completion
" Only apply on vim (nvim has good defaults)
if !has('nvim')
    set wildignorecase              " Case insensitive 
    set wildmode=list:longest,full  " Completion behavior
endif

" Cursor settings
" Nvim already switches cursor in insert mode
if !has('nvim')
    let &t_SI = "\e[5 q"            " Insert mode blinking line
    let &t_EI = "\e[2 q"            " Normal mode solid block
endif

" netrw settings
" Note: Do not disable banner because of nvim bug with wl-copy
" https://github.com/neovim/neovim/issues/23650
" On gnome, wl-copy also opens a GUI window, momentarily taking focus from
" vim. With banner disabled and tree style, this "spams" wl-copy
" making everything unusable
" let g:netrw_banner=0
let g:netrw_liststyle=3             " Tree style

" Custom keybinds
nnoremap <leader>l :ls<CR>:b<space>

" ------------------------------------------------------------------------------

