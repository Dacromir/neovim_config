return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      highlight = {
        enable = true,
	additional_vim_regex_highlighting = false,
      },
    })

    -- Automatically install these treesitters 
    require('nvim-treesitter').install({
      'css',
      'html',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'python',
      'regex',
      'vimdoc',
    })
    
    vim.api.nvim_create_autocmd('FileType',{
      pattern = {
        'css',
        'html',
        'json',
        'lua',
        'markdown',
        'python',
      },
      callback = function() vim.treesitter.start() end,
  })

  end
};
