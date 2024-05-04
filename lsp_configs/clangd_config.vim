lua << EOF
    -- Directory containing compile_commands.json
    -- Uncomment one
    local build_dir = "build/"
    -- local build_dir = "build/PRESET1"
    -- local build_dir = "build/PRESET2"

    -- Start language server
    require('lspconfig').clangd.setup{
        cmd = { "clangd", "--compile-commands-dir=" .. build_dir },

        -- Uncomment to use the directory with this file as the root directory
        -- instead of searching for parent directory with .clangd, compile_commands.json, etc
        root_dir = function(fname)
            return vim.fn.expand('<script>:hp')
        end
    }
EOF
