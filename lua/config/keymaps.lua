-- General
vim.keymap.set("n", "<leader>t", "<cmd>botright split | terminal<cr>i", { desc = "Open a terminal" })
vim.keymap.set('t', '<Esc>', "<C-\\><C-n>",{ desc = "Exit terminal mode with Esc", silent = true })

-- Rust LSP
vim.keymap.set("n", "<leader>rd", function()
  vim.cmd.RustLsp('renderDiagnostic', 'current')
end, { desc = "Show Rust diagnostic" })
