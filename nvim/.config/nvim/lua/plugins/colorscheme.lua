return {
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
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    -- opts = {
    --   transparent = true,
    -- },
    config = function()
      -- require('tokyonight').setup({
      --   style = "storm",
      --   light_style = "day",
      --   transparent = "true",
      --   styles = {
      --     sidebars = "transparent",
      --     floats = "transparent",
      --   }
      -- })
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
}
