-- Terminal
vim.keymap.set("n", "<leader>t", "<cmd>botright 10split | terminal<cr>i", { desc = "Open a terminal" })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>", { desc = "Exit terminal mode with Esc", silent = true })

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
        vim.cmd("wincmd L")
        vim.cmd("wincmd h")
    end,
    { desc = "Open git diffview vs main" }
)
vim.keymap.set(
    "n",
    "<leader>dvo",
    function()
        vim.cmd("DiffviewOpen")
        vim.cmd("wincmd l")
        vim.cmd("wincmd L")
        vim.cmd("wincmd h")
    end,
    { desc = "Open git diffview" }
)

-- GitSigns keymaps managed in GitSigns config

-- Neotree
vim.keymap.set("n", "<leader>ntf", "<cmd>Neotree reveal<cr>", { desc = "Focus on neotree window" })
vim.keymap.set("n", "<leader>nth", "<cmd>Neotree current<cr>", { desc = "Open neotree on top of current window" })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Telescope search current buffer' })
vim.keymap.set('n', '<leader>fc', builtin.live_grep, { desc = 'Telescope search file contents' })
vim.keymap.set('n', '<leader>fhc', function() builtin.live_grep({ hidden = true, no_ignore = true }) end,
    { desc = 'Telescope search all file contents, including hidden files' })
vim.keymap.set('n', '<leader>fn', builtin.find_files, { desc = 'Telescope find file name' })
