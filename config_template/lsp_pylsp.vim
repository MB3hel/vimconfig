" Required (from pip): python-lsp-server, pylint, and rope
" Install pylint in venv if using one

" Can add args to pylint for things such as enabling C extension processing
" Eg: --extension-pkg-whitelist=PySide6

lua << EOF
    -- Store directory this script is located in
    local script_dir = vim.fn.expand('<script>:hp')

    -- Start language server
    require('lspconfig').pylsp.setup{
        -- Uncomment to use the directory with this file as the root directory
        -- instead of searching for parent directory with setup.py, requirements.txt, etc
        root_dir = function(fname)
            return script_dir
        end,

        -- Which tools to enable (and settings for those tools)
        -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
        settings = {
            pylsp = {
                plugins = {
                    autopep8 = {
                        enabled = false
                    },
                    flake8 = {
                        enabled = false
                    },
                    jedi_completion = {
                        enabled = false
                    },
                    jedi_definition = {
                        enabled = false
                    },
                    jedi_hover = {
                        enabled = false
                    },
                    jedi_references = {
                        enabled = false
                    },
                    jedi_signature_help = {
                        enabled = false
                    },
                    jedi_symbols = {
                        enabled = false
                    },
                    mccabe = {
                        enabled = false
                    },
                    preload = {
                        enabled = false
                    },
                    pycodestyle = {
                        enabled = false
                    },
                    pydocstyle = {
                        enabled = false
                    },
                    pyflakes = {
                        enabled = false
                    },
                    pylint = {
                        enabled = true,
                        args = {}
                    },
                    rope_autoimport = {
                        completions = {
                            enabled = false
                        },
                        code_actions = {
                            enabled = false
                        }
                    },
                    rope_completion = {
                        enabled = true
                    },
                    yapf = {
                        enabled = false
                    }
                }
            }
        },

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
