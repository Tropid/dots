return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'folke/lazydev.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      require('mason').setup()
      require('lazydev').setup()

      lspconfig.lua_ls.setup({})
      lspconfig.zls.setup({})
    end
  }
}
