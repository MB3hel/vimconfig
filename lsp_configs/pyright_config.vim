" Must install pyright using pip
" Install in venv if using one

lua << EOF
    -- Store directory this script is located in
    local script_dir = vim.fn.expand('<script>:hp')

    -- Start language server
    require('lspconfig').pyright.setup{
        -- Uncomment to use the directory with this file as the root directory
        -- instead of searching for parent directory with setup.py, requirements.txt, etc
        root_dir = function(fname)
            return script_dir
        end
    }
EOF
