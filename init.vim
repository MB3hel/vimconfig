
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
nnoremap <C-X> :BufDel<CR>
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
    Plug 'ojroques/nvim-bufdel'
    Plug 'preservim/nerdtree'
call plug#end()

" -----------------------------------------------------------------------------
" BufDel config
" -----------------------------------------------------------------------------

lua require('bufdel').setup{next = 'tabs', quit = false}


" -----------------------------------------------------------------------------
" NerdTree config
" -----------------------------------------------------------------------------

" Don't allow nerdtree or netrw to open when invoking vim directory_name
" If this happens, it causes two NERDTree buffers
" Which causes BIG issues with 'prevent buffers from replacing NERDTree' stuff
" This leaves an empty buffer (with blank name)
" The isdirectory autovmd VimEnter code will close the empty buffer and
" replace it  with a 'new' buffer named '*'
" Thus, running vim directory
" Is the same as running cd directory; vim then opening NERDTree panel
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:NERDTreeHijackNetrw = 0

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTreeToggle' argv()[0] | wincmd p | enew | bprev | b#|bd# | execute 'cd '.argv()[0] | endif

" Change enter key to open file in previous window, BUT keep tree focused
let NERDTreeCustomOpenArgs = {'file': {'where':'p', 'keepopen':1, 'stay':1}}

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Don't let other buffers replace nerdtree in it's window
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" -----------------------------------------------------------------------------
" Custom guide / help
" -----------------------------------------------------------------------------

function! MyGuide()
    echo "General"
    echo "  CTRL+F    = Toggle File Tree"
    echo "  :xa to save all and close nvim"
    echo "  :qa! to close nvim without saving"
    echo "  :w to save current buffer"
    echo "  :wa to save all buffers" 
    echo ""
    echo "Buffers (used as tabs with bar on top)"
    echo "  CTRL+N    = Next Buffer"
    echo "  CTRL+P    = Previous Buffer"
    echo "  CTRL+C    = Create Buffer"
    echo "  CTRL+X    = Close Buffer"
    echo ""
    echo "Windows:"
    echo "  :split    = Horizontal Split"
    echo "  :vsplit   = Vertical Split"
    echo "  CTRL+W then arrows to navigate windows"
    echo "  :q to close a window"
    echo ""
    echo "Visual Mode"
    echo "  x = cut"
    echo "  y = copy"
    echo "  p = paste"
    echo ""
    echo "Normal Mode:"
    echo "  dd = cut line"
    echo "  u = undo"
    echo "  CTRL+R = redo"

endfunction
command! -nargs=0 MyGuide :call MyGuide()

" Startup message
autocmd VimEnter * echo "Run :MyGuide for workflow info."

