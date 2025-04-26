return {
  {
    "Exafunction/windsurf.nvim",
    enabled = false,
    opts = {
      lazy = true,
    },
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
        -- "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
}
