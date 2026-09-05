-- Colors
local black = "#1F1F1F" -- Background charcoal
local blue1 = "#9CDCFE" -- Variable
local blue2 = "#4FC1FF" -- Enum
local blue3 = "#569CD6" -- Keyword
local dgreen = "#6A9955" -- Comments
local lgreen = "#B5CEA8" -- Constants
local orange = "#CE9178" -- Strings
local purple = "#C586C0" -- Control keywords
local teal = "#4EC9B0" -- Types
local white = "#CCCCCC" -- Punctuation
local yellow = "#DCDCAA" -- Functions

local function md_colors()
    -- Backgrounds
    vim.api.nvim_set_hl(0, "Normal", {bg=black})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg=black})

    -- General
    vim.api.nvim_set_hl(0, "@keyword", {fg=blue3})
    vim.api.nvim_set_hl(0, "@property", {fg=blue1})
    vim.api.nvim_set_hl(0, "@variable", {fg=blue1})
    vim.api.nvim_set_hl(0, "Comment", {fg=dgreen})
    vim.api.nvim_set_hl(0, "Constant", {fg=lgreen})
    vim.api.nvim_set_hl(0, "Delimiter", {fg=white})
    vim.api.nvim_set_hl(0, "Function", {fg=yellow})
    vim.api.nvim_set_hl(0, "Statement", {fg=blue3})
    vim.api.nvim_set_hl(0, "String", {fg=orange})
    vim.api.nvim_set_hl(0, "Type", {fg=teal})

    -- Lua
    vim.api.nvim_set_hl(0, "@boolean.lua", {fg=blue3})
    vim.api.nvim_set_hl(0, "@function.builtin.lua", {fg=yellow})
    vim.api.nvim_set_hl(0, "@keyword.function.lua", {fg=purple})
    vim.api.nvim_set_hl(0, "@keyword.return.lua", {fg=purple})
    vim.api.nvim_set_hl(0, "@variable.member.lua", {fg=teal})

    -- Neotree
    vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", {fg="#ffffff"})
    vim.api.nvim_set_hl(0, "NeoTreeFileName", {fg="#cccccc"})
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", {fg="#e2c08d"})
    vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", {fg="#e2c08d"})
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", {fg="#73c991"})

    -- Python
    vim.api.nvim_set_hl(0, "@boolean.python", {fg=blue3})
    vim.api.nvim_set_hl(0, "@constant.builtin.python", {fg=blue3})
    vim.api.nvim_set_hl(0, "@function.builtin.python", {fg=yellow})
    vim.api.nvim_set_hl(0, "@keyword.python", {fg=purple})
    vim.api.nvim_set_hl(0, "@keyword.import.python", {fg=purple})
    vim.api.nvim_set_hl(0, "@keyword.return.python", {fg=purple})

    -- SQL
    vim.api.nvim_set_hl(0, "@variable.sql", {fg=white})
    vim.api.nvim_set_hl(0, "@variable.member.sql", {fg=white})
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = md_colors,
})

md_colors()
