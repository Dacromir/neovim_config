-- VS Code Theme color fixing
local property_fg = { fg = "#9CDCFE" }

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "@property", property_fg)
    vim.api.nvim_set_hl(0, "@variable.member", property_fg)
    vim.api.nvim_set_hl(0, "@lsp.type.property.rust", property_fg)
  end,
})
