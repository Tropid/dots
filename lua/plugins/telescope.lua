return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'fqschmidt93/telescope-egrepify.nvim',
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({})
    telescope.load_extension('egrepify')
  end
}
