
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
\       dotfiles = false,
\       git_ignored = false
\   },
\   actions = {
\       change_dir = {
\           restrict_above_cwd = true
\       }
\   }
\})

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" Diagnostics configuration
" -----------------------------------------------------------------------------

" Default diagnostic settings
" can change these in project-specific config.vim files
lua vim.diagnostic.config({
\       signs = { 
\           severity = { min = vim.diagnostic.severity.WARN }
\       },
\       virtual_text = {
\           severity = { min = vim.diagnostic.severity.WARN }
\       },
\       underline = {
\           severity = { min = vim.diagnostic.severity.WARN }
\       },
\       update_in_insert = true,
\       severity_sort = true
\   })


" Always show the sign column (where "E" is shown for lsp errors)
" By default, this is hidden if there are no signs
" but with errors updating in insert mode this causes
" text to be shifted right by a column when an error is detected
" Showing this all the time prevents this issue.
set signcolumn=yes

" Keybind to show floating diagnostics winodow
nnoremap <leader>d :lua vim.diagnostic.open_float()<CR>

" -----------------------------------------------------------------------------
