return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup({
        ensure_installed = { 'lua', 'vim', 'vimdoc' },
        highlight = { enable = true },
        indent = { enable = true },
      })

      require('treesitter-context').setup({
        enable = true,
        max_lines = 5,
      })
    end,
  }
}
