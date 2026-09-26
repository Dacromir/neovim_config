-- LSP
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Apply recommended code action" })
vim.keymap.set("n", "<leader>en", function() vim.diagnostic.jump({ count = 1, float = true }) end,
    { desc = "Jump to next error" })
vim.keymap.set("n", "<leader>ep", function() vim.diagnostic.jump({ count = -1, float = true }) end,
    { desc = "Jump to prev error" })
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "LSP auto format" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "List references for symbol" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

-- Move lines up and down
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Move selection up and down
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Git DiffView
vim.keymap.set("n", "<leader>dvc", function() vim.cmd("DiffviewClose") end, { desc = "Close git diffview" })
vim.keymap.set(
    "n",
    "<leader>dvm",
    function()
        vim.cmd({ cmd = "DiffviewOpen", args = { "main..." } })
        vim.cmd("wincmd l")
        vim.cmd("wincmd l")
    end,
    { desc = "Open git diffview vs main" }
)
vim.keymap.set(
    "n",
    "<leader>dvo",
    function()
        vim.cmd("DiffviewOpen")
        vim.cmd("wincmd l")
        vim.cmd("wincmd l")
    end,
    { desc = "Open git diffview" }
)

-- GitSigns keymaps managed in GitSigns config

-- Neotree
vim.keymap.set("n", "<leader>nb", "<cmd>Neotree focus buffers<cr>", { desc = "Open neotree buffer list" })
vim.keymap.set("n", "<leader>nf", "<cmd>Neotree reveal<cr>", { desc = "Open neotree file list" })
vim.keymap.set("n", "<leader>ng", "<cmd>Neotree focus git_status<cr>", { desc = "Open neotree git status" })
vim.keymap.set("n", "<leader>no", "<cmd>Neotree current<cr>", { desc = "Open neotree on top of current window" })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Telescope search current buffer' })
vim.keymap.set('n', '<leader>fc', builtin.live_grep, { desc = 'Telescope search file contents' })
vim.keymap.set('n', '<leader>fhc', function() builtin.live_grep({ hidden = true, no_ignore = true }) end,
    { desc = 'Telescope search all file contents, including hidden files' })
vim.keymap.set('n', '<leader>fn', builtin.find_files, { desc = 'Telescope find file name' })

-- Terminal
vim.api.nvim_create_user_command('OpenTerminal', function()
    -- Check if a terminal buffer already exists
    local term_buffer = nil
    for _, buffer_id in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buffer_id].buftype == 'terminal' then
            term_buffer = buffer_id
            break
        end
    end

    -- If a terminal was found, open it in a split
    if term_buffer then
        local win = vim.fn.bufwinid(term_buffer)
        if win == -1 then -- If it exists but isn't visible, open it in a split (or use :b to switch)
            vim.cmd('botright 10split | buffer ' .. term_buffer)
        else              -- If it exists and is visible, focus on it
            vim.api.nvim_set_current_win(win)
        end
    else -- Otherwise, open a new terminal
        vim.cmd('botright 10split | terminal')
    end
end, {})

vim.keymap.set("n", "<leader>t", "<cmd>OpenTerminal<cr>i", { desc = "Open a terminal" })
vim.keymap.set("n", "<leader>T", "<cmd>botright 10split | terminal<cr>i", { desc = "Open a new terminal" })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { desc = "Exit terminal mode with Esc", silent = true })

-- Buffer management
vim.api.nvim_create_user_command('ClearBuffers', function()
    -- Loop through all open buffers
    for _, buffer_id in ipairs(vim.api.nvim_list_bufs()) do
        local window_id = vim.fn.bufwinid(buffer_id)
        -- Delete the buffer if it's not currently visible
        if window_id == -1 then
            pcall(function() vim.api.nvim_buf_delete(buffer_id, {}) end)
        end
    end
end, {})

vim.keymap.set("n", "<leader>cb", "<cmd>ClearBuffers<cr>", { desc = "Delete all background buffers" })
