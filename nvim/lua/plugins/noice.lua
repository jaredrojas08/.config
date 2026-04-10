return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            routes = {
                {
                    filter = { event = "msg_showmode" },
                    view = "notify",
                },
            },
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                timeout = 2000,
            })
            vim.notify = require("notify")
        end,
    },
}
