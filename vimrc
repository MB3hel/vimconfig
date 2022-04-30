" -----------------------------------------------------------------------------
" General Configuration
" -----------------------------------------------------------------------------

" Wrap to next/previous line
set whichwrap+=<,>,h,l,[,]

" Make backspace work as expected (mostly needed on windows)
set backspace=indent,eol,start

" Tabs are 4 wide. Use spaces not tabs.
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" Preserve indent
set smartindent


" -----------------------------------------------------------------------------
" vim-plug plugin manager
" -----------------------------------------------------------------------------
" Note: Run PlugInstall or PlugUpdate after changes
call plug#begin()

Plug 'ynkdir/vim-vimlparser'
Plug 'syngan/vim-vimlint'
Plug 'neomake/neomake'

call plug#end()


" -----------------------------------------------------------------------------
" Neomake settings
" -----------------------------------------------------------------------------
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

