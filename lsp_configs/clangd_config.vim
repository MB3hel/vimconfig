" Must have cland installed on the system
" Build system must generate compile_commands.json

lua << EOF
    -- Store directory this script is located in
    local script_dir = vim.fn.expand('<script>:hp')
    
    -- Start language server
    require('lspconfig').clangd.setup{
        cmd = { 
            "clangd", 

            -- Directory contianing compile_commands.json
            "--compile-commands-dir=build/",
            
            -- Completion settings
            "--header-insertion=never",
            "--all-scopes-completion=false"
        },

        -- Uncomment to use the directory with this file as the root directory
        -- instead of searching for parent directory with .clangd, compile_commands.json, etc
        root_dir = function(fname)
            return script_dir
        end,

        -- Proper integration with nvim-cmp plugin
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    
    -- nvim-cmp settings
    require('cmp').setup { 
        completion = {
            -- Uncomment for manual completion only
            -- autocomplete = false
        }
    }
EOF

