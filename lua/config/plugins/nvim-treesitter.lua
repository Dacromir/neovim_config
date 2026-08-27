return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install({
      'markdown',
      'markdown_inline',
      'html',
      'css',
      'regex',
      'python',
      'lua',
    })
  end
};
