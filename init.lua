-- Revert to default vim colorscheme instead of nvim 0.10+'s new default
-- vim.cmd('colorscheme vim')
-- vim.cmd('set notermguicolors')
-- vim.cmd('highlight ColorColumn ctermbg=238')

-- Darken background of default color scheme
vim.cmd('hi normal guibg=NvimDarkGrey1')

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
-- vim.api.nvim_set_keymap('n', '<C-W>d', ':lua vim.diagnostic.open_float()<CR>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', {noremap=true})
-- vim.api.nvim_set_keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', {noremap=true})
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
        { name = 'nvim_lsp' }
    }
})

-- Limit menu height
-- vim.opt.pumheight=30
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Functions for use in .lvimrc files
--------------------------------------------------------------------------------
function disable_autocomplete()
    require('cmp').setup { 
        completion = {
            autocomplete = false
        }
    }
end

function enable_autocomplete()
    require('cmp').setup { 
        completion = {
            autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
        }
    }
end

function start_lsp_pyright(extra_args)
    vim.lsp.config('pyright', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        cmd = { 'pyright-langserver', '--stdio', unpack(extra_args) }
    })
    vim.lsp.enable('pyright')
end

function start_lsp_clangd(extra_args)
    vim.lsp.config('clangd', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        cmd = { 'clangd', unpack(extra_args) }
    })
    vim.lsp.enable('clangd')
end
--------------------------------------------------------------------------------
