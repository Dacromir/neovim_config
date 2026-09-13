-- Misc
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.winborder = 'single' -- Adds a border around pop-up windows
vim.opt.ignorecase = true -- Ignore case while searching buffer

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.wrap = true

-- Autoformat on save with LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        -- Create an autocommand that runs right before a file is written to disk
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                -- Sync format ensures the file finishes formatting before saving
                vim.lsp.buf.format({ async = false, id = args.data.client_id })
            end,
        })
    end,
})
