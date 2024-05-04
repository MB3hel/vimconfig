" Must have cland installed on the system
" Build system must generate compile_commands.json

lua << EOF
    -- Store directory this script is located in
    local script_dir = vim.fn.expand('<script>:hp')
    
    -- Directory containing compile_commands.json
    local build_dir = "build/"

    -- Start language server
    require('lspconfig').clangd.setup{
        cmd = { "clangd", "--compile-commands-dir=" .. build_dir },

        -- Uncomment to use the directory with this file as the root directory
        -- instead of searching for parent directory with .clangd, compile_commands.json, etc
        root_dir = function(fname)
            return script_dir
        end,

        -- Enable completion using nvim-cmp
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
EOF
