return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    config = function()
        -- document existing key chains
        local wk = require("which-key")
        wk.add({
            { "<leader>e", name = "Explorer", icon = { icon = "󰙅" } },
            { "<leader>a", name = "Mark", icon = { icon = "" } },
            { "<leader>j", name = "Harpoon", icon = { icon = "" } },
            { "<leader>l", name = "Lsp", icon = { icon = "" } },
            { "<leader>s", name = "Search" },
            { "<leader>u", name = "Undotree", icon = { icon = "󰕍" } },
            { "<leader>w", name = "Save", icon = { icon = "" } },
            { "<leader>q", name = "Leave", icon = { icon = "󰕍" } },
        })
    end,
}
