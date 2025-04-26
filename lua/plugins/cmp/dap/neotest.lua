return {
    {
      "nvim-neotest/neotest",
      lazy = true,
      dependencies = {
        "nvim-neotest/nvim-nio",
        { "nvim-lua/plenary.nvim", lazy = true },
        "antoinemadec/FixCursorHold.nvim",
      }
    }
}
