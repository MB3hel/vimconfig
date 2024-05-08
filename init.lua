-- Load shared common (vim / nvim) config
vim.cmd('source ' .. vim.fn.expand('<script>:hp') .. '/vimrc')

--------------------------------------------------------------------------------
-- Plugin installation
--------------------------------------------------------------------------------
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug 'neovim/nvim-lspconfig'        -- Language server configs
Plug 'hrsh7th/nvim-cmp'             -- Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'         -- Autocomplete source for lang server
Plug 'hrsh7th/cmp-vsnip'            -- Autocomplete source for vnsip
Plug 'hrsh7th/vim-vsnip'            -- Snippets plugin
vim.call('plug#end')
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Diagnostics settings
--------------------------------------------------------------------------------
vim.diagnostic.config({
    signs = { 
        severity = { min = vim.diagnostic.severity.WARN }
    },
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    underline = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    update_in_insert = true,
    severity_sort = true
})

-- Always show sign column (even if there are no errors)
vim.opt.signcolumn="yes"
    
-- Keybinds (matching defaults in nvim 0.10+)
vim.api.nvim_set_keymap('n', '<C-W>d', ':lua vim.diagnostic.open_float()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', {noremap=true})
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- Autocompletion
--------------------------------------------------------------------------------
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

-- Limit menu height
vim.opt.pumheight=30
--------------------------------------------------------------------------------
