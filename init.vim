
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
" vim-plug plugin manager
" -----------------------------------------------------------------------------

" Note: Run PlugInstall or PlugUpdate after changes
call plug#begin()
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" nvim-tree config
" -----------------------------------------------------------------------------

nnoremap <C-F> :NvimTreeToggle<CR>

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
\       root_folder_label = ":~:s?$?",
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
\       git_ignored = false
\   },
\   actions = {
\       change_dir = {
\           restrict_above_cwd = true
\       }
\   }
\})

" -----------------------------------------------------------------------------

