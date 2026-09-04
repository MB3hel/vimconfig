
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
    hi! Normal guibg=NONE ctermbg=NONE
    hi! SignColumn guibg=NONE ctermbg=NONE
    hi! DiagnosticVirtualTextError guibg=NONE ctermbg=NONE
    hi! DiagnosticVirtualTextWarn guibg=NONE ctermbg=NONE
    hi! DiagnosticVirtualTextInfo guibg=NONE ctermbg=NONE
    hi! DiagnosticVirtualTextHint guibg=NONE ctermbg=NONE
endfunction

command -nargs=1 IndentSpaces call IndentSpaces(<q-args>)
command -nargs=1 IndentTabs call IndentTabs(<q-args>)

" Add to vimrc_overrides when terminal uses transparent bg or if you want to
" use default terminal bg color instead of having vim replace
command UseDefaultBg call DefaultBg()

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
if &t_Co < 16 && $TERM != 'linux'
    set t_Co=16                                 " Allow 16 ANSI colors unless we know the terminal can't
                                                " (only matters if notermguicolors; vim in PuTTY defaults to 8)
endif

" Color scheme settings
" Uses a custom function to load out of my cloned .vimconfig folder
" instead of normal colorschemes because it avoids needing to deal with
" symlinking or copying the colors folder. Which is a mess on windows
" This function can be called in vimrc overrides. Or after changing t_Co
" manually to re-apply the color scheme
function SourceCustomColors(scheme)
    execute 'source ' . $HOME . '/.vimconfig/colors/' . a:scheme . '.vim'
endfunction
command -nargs=1 CustomColors call SourceCustomColors(<q-args>)
CustomColors dark2026

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
    set guicursor=n-v-c-sm:block,i-ci-ve-r-cr-o:ver25,t:block-blinkon500-blinkoff500-TermCursor
else
    " vim uses escapes to the terminal
    let &t_SI = "\e[6 q"                            " Insert mode solid line
    let &t_EI = "\e[2 q"                            " Normal mode solid block
    let &t_te ..= "\e[0 q"                          " Restore to terminal's default cursor on exit
    let &t_ti ..= "\e[2 q"                          " Same as normal mode on vim start
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

