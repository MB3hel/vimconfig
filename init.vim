
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

" Case insensative tab completion for file / buffer names
set wildignorecase

" Faster switching of buffers
nnoremap <leader>l :ls<CR>:b<space>

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" vim-plug plugin manager
" -----------------------------------------------------------------------------

" Note: Run PlugInstall or PlugUpdate after changes
call plug#begin()
    Plug 'nvim-tree/nvim-tree.lua'          " File tree plugin
    Plug 'neovim/nvim-lspconfig'            " Configs for nvim's builtin lsp
    Plug 'hrsh7th/nvim-cmp'                 " Autocomplete plugin
    Plug 'hrsh7th/cmp-nvim-lsp'             " LSP sources for nvim-cmp
    Plug 'hrsh7th/cmp-vsnip'                " vsnip sources for nvim-cmp
    Plug 'hrsh7th/vim-vsnip'                " Snippets plugin
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
nnoremap <C-W>d :lua vim.diagnostic.open_float()<CR>

" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" Autocompletion
" -----------------------------------------------------------------------------

lua << EOF
    local cmp = require('cmp')
    cmp.setup({
        formatting = {
            format = function(_, item)
                -- Limit width of items to 20 characters
                -- so suggestion window is not massive
                item.abbr = string.sub(item.abbr, 1, 20)
                -- item.menu = ""
                -- item.kind = ""
                return item
            end
        },
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'vsnip' }
        }
    })
EOF

" Limit menu height
set pumheight=30

" -----------------------------------------------------------------------------

