
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

" nvim-tree keymaps
nnoremap <C-F> :NvimTreeToggle<CR>

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" vim-plug plugin manager
" -----------------------------------------------------------------------------

" Note: Run PlugInstall or PlugUpdate after changes
call plug#begin()
    Plug 'dense-analysis/ale'
    Plug 'ap/vim-buftabline'
    Plug 'ojroques/nvim-bufdel'
    Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" BufDel config
" -----------------------------------------------------------------------------

lua require('bufdel').setup{next = 'tabs', quit = false}

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" nvim-tree config
" -----------------------------------------------------------------------------

lua require("nvim-tree").setup({
\   sort = {
\       sorter = "name",
\       folders_first = true
\   },
\   view = {
\       width = 30,
\   },
\   renderer = {
\       add_trailing = true,
\       root_folder_label = ":~:s?$?/",
\       icons = {
\           show = {
\               file = false,
\               folder = false,
\               folder_arrow = false,
\               git = false
\           }
\       }
\   },
\   filters = {
\       dotfiles = true,
\   },
\   actions = {
\       change_dir = {
\           restrict_above_cwd = true
\       }
\   }
\})

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" ALE config
" -----------------------------------------------------------------------------

let g:ale_lint_on_text_changed = 'normal' 
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 1

" -----------------------------------------------------------------------------



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

" -----------------------------------------------------------------------------

