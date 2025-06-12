return {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    dependencies = {
        "neovim/nvim-lspconfig",
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
        "folke/neodev.nvim",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        -- lsp_attach: attach keymaps after LSP attaches to buffer
        local lsp_attach = function(_, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Replace" }))
            vim.keymap.set({ "n", "x" }, "<leader>lf", function()
                vim.lsp.buf.format({ async = true })
            end, vim.tbl_extend("force", opts, { desc = "Format" }))
            vim.keymap.set(
                "n",
                "<leader>la",
                vim.lsp.buf.code_action,
                vim.tbl_extend("force", opts, { desc = "Actions" })
            )
        end

        -- Extend lsp-zero with custom settings
        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        -- Mason & mason-lspconfig setup
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "tsserver", -- TypeScript/JavaScript
                "eslint", -- ESLint
                "tailwindcss", -- Tailwind CSS
                "cssls", -- CSS
                "html", -- HTML
                "jsonls", -- JSON
                "emmet_ls", -- Emmet
                "marksman", -- Markdown
                "denols", -- Deno
                "pyright", -- Python
                "lua_ls", -- Lua
                "bashls", -- Bash
            },
            automatic_installation = true,
            handlers = {
                -- Custom handler for html-lsp -> lspconfig.html
                ["html-lsp"] = function()
                    require("lspconfig").html.setup({})
                end,
                -- default handler for other servers
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        })
    end,
}
