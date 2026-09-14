return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup {
            -- Set keymaps on attach
            on_attach                    = function(bufnr)
                local gs = package.loaded.gitsigns

                vim.keymap.set("n", "<leader>df", gs.diffthis, { desc = "Open diff view for file" })
                vim.keymap.set("n", "<leader>dl", gs.preview_hunk, { desc = "Open diff view for line" })
                vim.keymap.set("n", "<leader>dc", function()
                    -- Turn off diff mode for the current window
                    vim.cmd('diffoff')
                    -- Find and close the temporary gitsigns diff buffer if it's still open
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        local name = vim.api.nvim_buf_get_name(buf)
                        if name:match('gitsigns://') then
                            vim.cmd('bdelete ' .. buf)
                        end
                    end
                end, { desc = "Open diff view for file" })
            end,

            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged                 = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable          = true,
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            blame_formatter              = nil, -- Use default
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
        }
    end
};
