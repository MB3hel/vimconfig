
" -----------------------------------------------------------------------------
" General Configuration
" -----------------------------------------------------------------------------

" No linewrap by default
set nowrap

" Show line numbers by default
set number

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
nnoremap <C-X> :BD!<CR>
nnoremap <C-H> :split<CR>
nnoremap <C-V> :vsplit<CR>

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
call plug#end()


" -----------------------------------------------------------------------------
" NerdTree config
" -----------------------------------------------------------------------------

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1

" Disabled
" Causes issues with vim-bufkill
" Reproduce issue
"   Uncomment this line
"   nvim Directory/
"   Open a file in Directory/ using NERDTree
"   CTRL-X
"   Look at error messages.
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTreeToggle' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Change enter key to open file in previous window, BUT keep tree focused
let NERDTreeCustomOpenArgs = {'file': {'where':'p', 'keepopen':1, 'stay':1}}


" -----------------------------------------------------------------------------
" Custom guide / help
" -----------------------------------------------------------------------------

function! MyGuide()
    echo "CTRL+F = Toggle File Tree"
    echo ":terminal = Open terminal buffer"
    echo ""
    echo "CTRL+N = Next Buffer"
    echo "CTRL+P = Previous Buffer"
    echo "CTRL+C = Create Buffer"
    echo "CTRL+X = Close Buffer"
    echo ":BD!   = Force Close Buffer"
    echo ""
    echo "CTRL+H = Horizontal Split"
    echo "CTRL+V = Vertical Split"
    echo "CTRL+W then arrows to navigate windows"
    echo ":q to close a split window"
    echo ":xa to save and close nvim"
    echo ":w to save current buffer"
    echo ":wa to save all buffers"
    echo ""
    echo "CTRL+SHIFT+C/V to copy / paste (terminal emulator)"
    echo "In visual mode (v) x = cut, y = copy, p = paste, d = delete"
    echo "Press d twice to delete line"

endfunction
command! -nargs=0 MyGuide :call MyGuide()

" Startup message
autocmd VimEnter * echo "Run :MyGuide for workflow info."

