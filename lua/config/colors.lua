-- Colors
local cn_gre = "#B5CEA8" -- Constants
local blue1 = "#9CDCFE" -- Variable
local blue2 = "#4FC1FF" -- Enum
local blue3 = "#569CD6" -- Keyword
local dgreen = "#6A9955" -- Comments
local fn_yel = "#DCDCAA" -- Functions
local lgray = "#CCCCCC" -- Punctuation
local purple = "#C586C0" -- Control keywords
local st_ora = "#CE9178" -- Strings
local teal = "#4EC9B0"

local function md_colors()
    -- General
    vim.api.nvim_set_hl(0, "@keyword", {fg=blue3})
    vim.api.nvim_set_hl(0, "@property", {fg=blue1})
    vim.api.nvim_set_hl(0, "@variable", {fg=blue1})
    vim.api.nvim_set_hl(0, "Comment", {fg=dgreen})
    vim.api.nvim_set_hl(0, "Constant", {fg=cn_gre})
    vim.api.nvim_set_hl(0, "Delimiter", {fg=lgray})
    vim.api.nvim_set_hl(0, "Function", {fg=fn_yel})
    vim.api.nvim_set_hl(0, "String", {fg=st_ora})

    -- Lua
    vim.api.nvim_set_hl(0, "@keyword.function.lua", {fg=purple})
    vim.api.nvim_set_hl(0, "@variable.member.lua", {fg=teal})
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = md_colors,
})

md_colors()
