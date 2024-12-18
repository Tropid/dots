return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true,
        },
      })
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  --   config = function()
  --     require('tokyonight').setup({
  --       style = "storm",
  --       light_style = "day",
  --       transparent = "true",
  --       styles = {
  --         sidebars = "transparent",
  --         floats = "transparent",
  --       }
  --     })
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
}
