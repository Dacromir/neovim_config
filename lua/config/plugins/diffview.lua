return {
    'sindrets/diffview.nvim',
    opts = {
        hooks = {
            diff_buf_read = function(bufnr)
                -- Show all context (don't fold)
                vim.opt_local.diffopt:append("context:99999")
            end,
        },
    },
};
