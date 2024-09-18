return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>e", group = "Explore" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>h", group = "Gitsigns" },
      { "<leader>s", group = "Snippets" },
      { "<leader>o", group = "Overseer" },
      { "<leader>a", group = "AI" },

      { "<leader>a", group = "AI", mode = "x" },
      { "<leader>l", group = "LSP", mode = "x" },
      { "<leader>s", group = "Snippets", mode = "x" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
