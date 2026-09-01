-- General
vim.keymap.set("n", "<leader>t", "<cmd>botright 10split | terminal<cr>i", { desc = "Open a terminal" })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>",{ desc = "Exit terminal mode with Esc", silent = true })

-- LSP
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Apply recommended code action" })
vim.keymap.set("n", "<leader>el", function() vim.diagnostic.jump({count=1,float=true}) end, { desc = "Jump to next error"})
vim.keymap.set("n", "<leader>eh", function() vim.diagnostic.jump({count=-1,float=true}) end, { desc = "Jump to prev error"})
