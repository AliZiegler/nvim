return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        -- Set up Mason for null-ls
        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "selene",
            },
            automatic_installation = true,
        })

        -- Configure null-ls
        null_ls.setup({
            sources = {

                -- Lua
                formatting.stylua,
                -- diagnostics.selene, -- Uncomment if you want to enable selene diagnostics

                -- Git and refactoring tools
                code_actions.gitsigns,
                code_actions.refactoring,
            },
            on_attach = function(client, bufnr)
                -- Set up buffer-specific keymaps or settings if necessary
            end,
        })
    end,
}
