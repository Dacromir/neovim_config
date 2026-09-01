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
      'markdown',
      'markdown_inline',
      'html',
      'css',
      'regex',
      'python',
      'lua',
      'json',
    })
    
    vim.api.nvim_create_autocmd('FileType',{
      pattern = {
        'markdown',
	'html',
	'css',
	'python',
	'lua',
	'json'
      },
      callback = function() vim.treesitter.start() end,
  })

  end
};
