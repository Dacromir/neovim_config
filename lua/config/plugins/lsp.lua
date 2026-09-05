return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "pylsp" },
                automatic_installation = true,
            })
            -- Lua
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            -- Python
            vim.lsp.config('pylsp', {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {
                                    "E302", -- Spacing around function definitions
                                    "E305", -- Spacing around `with` blocks
                                    "W292", -- Required newline at end of file
                                },
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
    },
}
