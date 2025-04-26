return {
    {
        "mfussenegger/nvim-dap",
        "jayp0521/mason-nvim-dap.nvim",
        "leoluz/nvim-dap-go",
        "theHamsta/nvim-dap-virtual-text",
        {
            "rcarriga/nvim-dap-ui",
            config = function()
                require('dapui').setup()
            end,
            dependencies = { "nvim-neotest/nvim-nio" }
        },
    },
}

