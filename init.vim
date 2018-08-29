" Wrap to next/previous line
set whichwrap+=<,>,h,l,[,]

" Make backspace work as expected (mostly needed on windows)
set backspace=indent,eol,start

" Tabs are 4 wide. Use spaces not tabs.
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'ynkdir/vim-vimlparser'
Plug 'syngan/vim-vimlint'
Plug 'neomake/neomake'

call plug#end()

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_check_header = 1

" Neomake settings
" Full config: when writing or reading a buffer, and on changes in insert and
" When writing a buffer (no delay).
call neomake#configure#automake('w')
let g:neomake_open_list = 2 " Auto open error list (location list)

" Allow Project specific .vimrc files (safe commands only)
set exrc
set secure " Keep this as the last line in the vimrc file
