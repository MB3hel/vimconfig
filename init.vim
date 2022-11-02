
" -----------------------------------------------------------------------------
" General Configuration
" -----------------------------------------------------------------------------

" Wrap to next/previous line
set whichwrap+=<,>,h,l,[,]

" Don't prompt for save when buffer hidden
set hidden

" Make backspace work as expected (mostly needed on windows)
set backspace=indent,eol,start

" Tabs are 4 wide. Use spaces not tabs.
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" Preserve indent
set smartindent

" Use system clipbaord
" Note: Must install xclip (x11) or wl-clipboard (wayland)
set clipboard+=unnamedplus

" -----------------------------------------------------------------------------
" Keyboard shortcuts
" -----------------------------------------------------------------------------

" Buffer navigation
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-C> :enew<CR>
nnoremap <C-X> :BD<CR>

" NerdTree keymaps
nnoremap <C-F> :NERDTreeToggle<CR>


" -----------------------------------------------------------------------------
" vim-plug plugin manager
" -----------------------------------------------------------------------------

" Note: Run PlugInstall or PlugUpdate after changes
call plug#begin()
    Plug 'dense-analysis/ale'
    Plug 'ap/vim-buftabline'
    Plug 'qpkorr/vim-bufkill'
    Plug 'preservim/nerdtree'
    Plug 'xolox/vim-session'
    Plug 'xolox/vim-misc'
call plug#end()


" -----------------------------------------------------------------------------
" NerdTree config
" -----------------------------------------------------------------------------

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Change enter key to open file in previous window, BUT keep tree focused
let NERDTreeCustomOpenArgs = {'file': {'where':'p', 'keepopen':1, 'stay':1}}


" -----------------------------------------------------------------------------
" vim-session config
" -----------------------------------------------------------------------------

let g:session_directory = '.'
let g:session_default_name = 'Session'
let g:session_default_overwrite = 1
let g:session_autosave = 'no'
let g:session_autoload = 'no'

