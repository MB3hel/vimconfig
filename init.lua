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

-- Enable autocomplete
require('cmp').setup { 
    completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
    }
}

-- Limit menu height
-- vim.opt.pumheight=30
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Setup of language servers and autocomplete
--------------------------------------------------------------------------------
-- pyright (python)
if vim.fn.executable('pyright') == 1 then
    vim.lsp.config('pyright', {
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
    vim.lsp.enable('pyright')
end


-- clangd (c, c++)
if vim.fn.executable('clangd') == 1 then
    vim.lsp.config('clangd', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        cmd = { 'clangd', '--header-insertion=never' }
    })
    vim.lsp.enable('clangd')
end


-- rust-analyzer (rust)
if vim.fn.executable('rust-analyzer') == 1 then
    vim.lsp.config('rust_analyzer', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
            ['rust-analyzer'] = {
                diagnostics = { enable = true },
            }
        },
    })
    vim.lsp.enable('rust_analyzer')
end
--------------------------------------------------------------------------------
