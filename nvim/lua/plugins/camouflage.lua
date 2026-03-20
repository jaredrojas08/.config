return {
    "zeybek/camouflage.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        { "<leader>ct", "<cmd>CamouflageToggle<cr>", desc = "Toggle Camouflage" },
        { "<leader>cr", "<cmd>CamouflageReveal<cr>", desc = "Reveal Line" },
        { "<leader>cy", "<cmd>CamouflageYank<cr>",   desc = "Yank Value" },
    },
}
